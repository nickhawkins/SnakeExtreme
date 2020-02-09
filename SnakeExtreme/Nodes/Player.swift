//
//  Player.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 24/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The player node.
 */
class Player : SKNode {
    
    /**
     Private variables.
     */
    private var snake: Snake
    private var joystick: Joystick
    
    /**
     Initialises a new player.
     */
    init(position: CGPoint) {
        
        // Initialise the child nodes.
        self.snake = Snake()
        self.snake.position = position
        self.joystick = Joystick()
        
        // Super init.
        super.init()
        
        // Add the child nodes.
        self.addChild(self.snake)
        self.addChild(self.joystick)
    }

    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Update the snake.
     */
    func update(currentTime: CFTimeInterval) {
        
        // Update the head.
        self.snake.update(currentTime: currentTime, joystickActive: joystick.getActive(), joystickDegrees: joystick.getDegrees())
    }
    
    /**
     Touch began at.
     */
    func touchBeganAt(location: CGPoint) {
        
        // Enable the joystick.
        self.joystick.enable(location: location);
    }

    /**
     Touch moved to.
     */
    func touchMovedTo(location: CGPoint) {
        
        // Update the joystick.
        self.joystick.update(location: location);
    }

    /**
     Touch ended.
     */
    func touchEnded() {
        
        // Disable the joystick.
        self.joystick.disable()
    }
    
    /**
     Adds a body part.
     */
    func addBodyPart() {
        
        self.snake.addBodyPart()
    }
}
