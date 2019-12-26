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
    
    /**
     Initialises a new snake.
     */
    override init() {
        
        // Initialise the child nodes.
        self.head = Head()
        
        // Super init.
        super.init()
        
        // Add the child nodes.
        self.addChild(self.head)
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
    }
}
