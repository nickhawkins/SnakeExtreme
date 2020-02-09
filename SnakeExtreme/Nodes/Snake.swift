//
//  Snake.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The snake node.
 */
class Snake : SKNode {
    
    /**
     Private variables.
     */
    private var head: Head
    private var body: Body
    
    /**
     Initialises a new snake.
     */
    override init() {
        
        // Initialise the child nodes.
        self.head = Head()
        self.body = Body()
        
        // Super init.
        super.init()
        
        // Add the child nodes.
        self.addChild(self.head)
        self.addChild(self.body)
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
    func update(currentTime: CFTimeInterval, joystickActive: Bool, joystickDegrees: CGFloat) {
        
        // Update the head.
        self.head.update(currentTime: currentTime, joystickActive: joystickActive, joystickDegrees: joystickDegrees)
        
        
        // Update the body.
        self.body.update(positions: self.head.getPositions(), speed: self.head.getSpeed())
    }
    
    /**
     Adds a body part.
     */
    func addBodyPart() {
        
        self.body.addBodyPart()
    }
}
