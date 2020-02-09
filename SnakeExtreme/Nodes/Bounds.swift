//
//  Bounds.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The bounds node.
 */
class Bounds : SKNode {
    
    /**
     Private variables.
     */
    private var floor: SKShapeNode
    private var ceiling: SKShapeNode
    private var leftWall: SKShapeNode
    private var rightWall: SKShapeNode
    
    /**
     Initialises a new head.
     */
    init(rect: CGRect) {
        
        let topSpace = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)! + rect.height / 20
        let floorSpace = rect.height / 10
        
        let floorPoints: [CGPoint] = [CGPoint(x: 0, y: floorSpace), CGPoint(x: rect.size.width, y: floorSpace)]
        let floorPointsPointer = UnsafeMutablePointer<CGPoint>.allocate(capacity: 2)
        floorPointsPointer.initialize(from: floorPoints, count: 2)
        
        let ceilingPoints: [CGPoint] = [CGPoint(x: 0, y: rect.size.height - topSpace), CGPoint(x: rect.size.width, y: rect.size.height  - topSpace)]
        let ceilingPointsPointer = UnsafeMutablePointer<CGPoint>.allocate(capacity: 2)
        ceilingPointsPointer.initialize(from: ceilingPoints, count: 2)
        
        let leftWallPoints: [CGPoint] = [CGPoint(x: 0, y: floorSpace), CGPoint(x: 0, y: rect.size.height - topSpace)]
        let leftWallPointsPointer = UnsafeMutablePointer<CGPoint>.allocate(capacity: 2)
        leftWallPointsPointer.initialize(from: leftWallPoints, count: 2)
        
        let rightWallPoints: [CGPoint] = [CGPoint(x: rect.size.width, y: floorSpace), CGPoint(x: rect.size.width, y: rect.size.height - topSpace)]
        let rightWallPointsPointer = UnsafeMutablePointer<CGPoint>.allocate(capacity: 2)
        rightWallPointsPointer.initialize(from: rightWallPoints, count: 2)
        
        // Build the floor.
        self.floor = SKShapeNode.init(points: floorPointsPointer, count: 2)
        self.floor.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rect.size.width, height: 1), center: CGPoint(x: rect.size.width / 2, y: floorSpace))
        self.floor.physicsBody!.isDynamic = true;
        self.floor.physicsBody!.affectedByGravity = false;
        self.floor.physicsBody!.usesPreciseCollisionDetection = true;
        self.floor.physicsBody!.categoryBitMask = Category.boundsCategory;
        self.floor.physicsBody!.contactTestBitMask = Category.headCategory;
        self.floor.physicsBody!.collisionBitMask = 0
        self.floor.alpha = 1
        self.floor.strokeColor = UIColor.white
        
        // Build the ceiling.
        self.ceiling = SKShapeNode.init(points: ceilingPointsPointer, count: 2)
        self.ceiling.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rect.size.width, height: 1), center: CGPoint(x: rect.size.width / 2, y: rect.size.height - topSpace))
        self.ceiling.physicsBody!.isDynamic = true
        self.ceiling.physicsBody!.affectedByGravity = false
        self.ceiling.physicsBody!.usesPreciseCollisionDetection = true
        self.ceiling.physicsBody!.categoryBitMask = Category.boundsCategory
        self.ceiling.physicsBody!.contactTestBitMask = Category.headCategory
        self.ceiling.physicsBody!.collisionBitMask = 0
        self.ceiling.alpha = 1
        self.ceiling.strokeColor = UIColor.white
        
        // Build the left wall.
        self.leftWall = SKShapeNode.init(points: leftWallPointsPointer, count: 2)
        self.leftWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: rect.size.height), center: CGPoint(x: 0, y: rect.size.height / 2))
        self.leftWall.physicsBody!.isDynamic = true
        self.leftWall.physicsBody!.affectedByGravity = false
        self.leftWall.physicsBody!.usesPreciseCollisionDetection = true
        self.leftWall.physicsBody!.categoryBitMask = Category.boundsCategory
        self.leftWall.physicsBody!.contactTestBitMask = Category.headCategory
        self.leftWall.physicsBody!.collisionBitMask = 0
        self.leftWall.alpha = 1
        self.leftWall.strokeColor = UIColor.white
        
        // Build the right wall.
        self.rightWall = SKShapeNode.init(points: rightWallPointsPointer, count: 2)
        self.rightWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: rect.size.height), center: CGPoint(x: rect.size.width, y: rect.size.height / 2))
        self.rightWall.physicsBody!.isDynamic = true
        self.rightWall.physicsBody!.affectedByGravity = false
        self.rightWall.physicsBody!.usesPreciseCollisionDetection = true
        self.rightWall.physicsBody!.categoryBitMask = Category.boundsCategory
        self.rightWall.physicsBody!.contactTestBitMask = Category.headCategory
        self.rightWall.physicsBody!.collisionBitMask = 0
        self.rightWall.alpha = 1
        self.rightWall.strokeColor = UIColor.white
    
        // Super init.
        super.init()
        
        // Add the nodes.
        addChild(floor)
        addChild(ceiling)
        addChild(leftWall)
        addChild(rightWall)
    }
    
    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
