//
//  Food.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The food node.
 */
class Food : SKNode {
    
    /**
     Private variables.
     */
    private var lastUpdateTimeInterval: CFTimeInterval = 0
    private var bounds: CGRect
    private var foodSize = 8
    
    /**
     Initialises a new head.
     */
    init(bounds: CGRect) {
        
        // Set up the food.
        self.bounds = bounds
        
        // Super init.
        super.init()
    }
    
    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Update the food.
     */
    func update(currentTime: CFTimeInterval) {

        if currentTime < self.lastUpdateTimeInterval + 2.5 {
            return;
        }
        
        self.lastUpdateTimeInterval = currentTime;
        
        self.addFood()
    }
    
    /**
     Adds food.
     */
    func addFood() {
        
        let safeHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        let ceiling = self.bounds.height / 20 + safeHeight!
        let floor = self.bounds.height / 10
        let x = Int.random(in: self.foodSize ..< Int(self.bounds.width) - self.foodSize)
        let y = Int.random(in: self.foodSize + Int(floor) ..< Int(self.bounds.height) - (self.foodSize + Int(ceiling)))
        
        // Add the food.
        let food = SKShapeNode.init(rectOf: CGSize(width: self.foodSize, height: self.foodSize))
        food.strokeColor = UIColor.white
        food.fillColor = UIColor.clear
        food.position = CGPoint(x: x, y: y)
        food.physicsBody = SKPhysicsBody.init(rectangleOf: CGSize(width: self.foodSize, height: self.foodSize))
        food.physicsBody?.isDynamic = true;
        food.physicsBody?.affectedByGravity = false;
        food.physicsBody?.usesPreciseCollisionDetection = true;
        food.physicsBody?.categoryBitMask = Category.foodCategory;
        food.physicsBody?.contactTestBitMask = Category.headCategory;
        food.physicsBody?.collisionBitMask = 0;
        food.alpha = 0
        addChild(food)
        
        // Run the food action.
        let fade = SKAction.fadeIn(withDuration: 0.15)
        food.run(fade)
    }
    
    /**
     Removes the food.
     */
    func removeFood(physicsBody: SKPhysicsBody) {
        
        let food = physicsBody.node
        
        food?.removeFromParent()
    }

}
