//
//  Button.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 02/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The button node.
 */
class Button: SKNode {
    
    /**
     Private variables.
     */
    private var outline: SKShapeNode
    private var label: Label
    private var action: () -> Void
    
    /**
     Initiates a new button.
     */
    init(height: CGFloat, width: CGFloat, text: String, buttonAction: @escaping () -> Void) {
        
        // Set up the button.
        self.outline = SKShapeNode.init(rectOf: CGSize(width: width, height: height))
        self.action = buttonAction
        self.label = Label(text: text, fontSize: 26, textColour: UIColor.white)
        self.label.position = CGPoint(x: 0, y: 0)
        
        super.init()

        // Add the child nodes.
        addChild(self.label)
    }
    
    /**
     The required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Handle the touch ended.
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            if self.outline.contains(touch.location(in: self)) {
                
                self.action()
            }
        }
    }
    
}