//
//  Body.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The body node.
 */
class Body : SKNode {
    
    /**
     Private variables.
     */
    private var bodySize = 26
    private var bodyParts = [SKShapeNode]()
    
    /**
     Initialises a new body..
     */
    override init() {
        
        // Super init.
        super.init()
        
        // Add the inital body parts.
        self.addBodyPart()
        self.addBodyPart()
        self.addBodyPart()
    }
    
    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Adds body parts
     */
    func addBodyPart() {
        
        // Create the body part.
        let bodyPart = SKShapeNode.init(rectOf: CGSize(width: self.bodySize, height: self.bodySize))
        bodyPart.zRotation = CGFloat(Double.pi / 2)
        bodyPart.fillColor = UIColor.clear
        bodyPart.alpha = 0;
        addChild(bodyPart)
        
        // Add the body part to the array.
        self.bodyParts.append(bodyPart)
    }

    /**
     Updates the body.
     */
    func update(positions: [Position], speed: CGFloat) {
        
        var count = 0
        
        for bodyPart in self.bodyParts {
            
            // Get the index of the postions.
            let distance = bodySize / 2
            let index = positions.count - ( count + 1 ) * Int(distance)
            if index < 0 {
                continue
            }
            
            // Get the position.
            let headPosition = positions[index]
            
            // Fade in the body part.
            if bodyPart.alpha == 0 {

                let fade = SKAction.fadeIn(withDuration: 0.15)
                bodyPart.run(fade)
            }
            
            // Set the body part position and rotataion.
            bodyPart.position = CGPoint(x: headPosition.xPosition, y: headPosition.yPosition)
            bodyPart.zRotation = CGFloat(headPosition.zRotaion)
            
            // Set the physics body.
            if bodyPart.physicsBody == nil && count != 0 {

                bodyPart.physicsBody = SKPhysicsBody.init(rectangleOf: CGSize(width: self.bodySize, height: self.bodySize))
                bodyPart.physicsBody!.isDynamic = true;
                bodyPart.physicsBody!.affectedByGravity = false;
                bodyPart.physicsBody!.usesPreciseCollisionDetection = true;
                bodyPart.physicsBody!.categoryBitMask = Category.bodyCategory;
                bodyPart.physicsBody!.contactTestBitMask = Category.headCategory;
                bodyPart.physicsBody!.collisionBitMask = 0;
            }
            
            count += 1
        }
        
    }
    
}
