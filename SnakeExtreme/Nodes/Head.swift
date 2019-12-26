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
    private var headSpeed: CGFloat = 80
    private var lastUpdateTimeInterval: CFTimeInterval = 0
    private var positions: [Position] = [Position]()
    
    /**
     Initialises a new head.
     */
    override init() {
        
        // Initialise the child nodes.
        self.head = SKShapeNode.init(rectOf: CGSize(width: headSize, height: headSize))
        
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
     Update the head.
     */
    func update(currentTime: CFTimeInterval, joystickActive: Bool, joystickDegrees: CGFloat) {

        // Calculate the next head position.
        var delta = currentTime - self.lastUpdateTimeInterval
        if delta > 0.02 {
            delta = 0.02
        }
        self.lastUpdateTimeInterval = currentTime
        let dx = self.head.position.x + CGFloat(self.headSpeed) * CGFloat(delta) * cos(self.head.zRotation)
        let dy = self.head.position.y + CGFloat(self.headSpeed) * CGFloat(delta) * sin(self.head.zRotation)

        // Set the next head position.
        self.head.position = CGPoint.init(x: dx, y: dy)
        
        // Save the position.
        let position = Position(xPosition: Double(dx), yPosition: Double(dy), zRotaion: Double(self.head.zRotation))
        self.positions.append(position)
        
        // Determine the rotation direction.
        if joystickActive == false {
            return;
        }
        
        var differenceDegrees = joystickDegrees - self.getHeadDegrees(delta: CGFloat(delta));
        if differenceDegrees < 0 {
            differenceDegrees += 360
        }
        
        // Update head rotation.
        let angleChange = self.headSpeed / 1000 / 2
        if differenceDegrees <= 180 {
            self.head.zRotation -= angleChange
        } else {
            self.head.zRotation += angleChange
        }
    }
    
    /**
     Gets the head degrees.
     */
    func getHeadDegrees(delta: CGFloat) -> CGFloat {
        
        let dx = self.head.position.x - 1000 * delta * cos(self.head.zRotation);
        let dy = self.head.position.y - 1000 * delta * sin(self.head.zRotation);
        let behindPoint = CGPoint(x: dx, y:  dy);
        let vector = CGVector(dx: self.head.position.x - behindPoint.x, dy: self.head.position.y - behindPoint.y)
        let angle = atan2(vector.dx, vector.dy);
        var headDegrees: CGFloat = angle * 180 / CGFloat(Double.pi);
        
        if headDegrees < 0 {
            headDegrees += 360
        }

        return headDegrees;
    }

}
