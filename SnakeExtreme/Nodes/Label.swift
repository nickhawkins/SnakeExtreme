//
//  Label.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 02/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The label node.
 */
class Label: SKNode {
    
    /**
     Private variables.
     */
    private var label: SKLabelNode
    
    /**
     Initiates a new label.
     */
    init(text: String, fontSize: CGFloat, textColour: UIColor) {
        
        // Set up the label.
        self.label = SKLabelNode(text: text)
        self.label.fontSize = fontSize
        self.label.horizontalAlignmentMode = .center;
        self.label.verticalAlignmentMode = .center
        self.label.fontName = "Space Invaders"
        self.label.fontColor = textColour
        
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
     Sets the text.
     */
    func setText(text: String) {
        
        self.label.text = text
    }
    
}
