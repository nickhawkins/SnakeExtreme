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
    
    /**
     Initialises a new player.
     */
    init(position: CGPoint) {
        
        // Initialise the child nodes.
        self.snake = Snake()
        self.snake.position = position
        
        // Super init.
        super.init()
        
        // Add the child nodes.
        self.addChild(self.snake)
    }

    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
