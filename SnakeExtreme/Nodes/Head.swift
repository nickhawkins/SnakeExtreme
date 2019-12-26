//
//  Head.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The head node.
 */
class Head : SKNode {
    
    /**
     Private variables.
     */
    private var head: SKShapeNode
    private var headSize = 14
    
    /**
     Initialises a new head.
     */
    override init() {
        
        // Initialise the child nodes.
        head = SKShapeNode.init(rectOf: CGSize(width: headSize, height: headSize))
        
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

}
