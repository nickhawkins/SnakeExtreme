//
//  Joystick.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 25/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import SpriteKit

/**
 The joystick node.
 */
class Joystick : SKNode {
    
    /**
     Private variables.
     */
    private var active = false;
    private var baseSize = 60
    private var stickSize = 80
    private var degrees: CGFloat = 0
    private var stick: SKShapeNode
    private var base: SKShapeNode
    
    /**
     Initialises a new joystick.
     */
    override init() {
        
        // Initialise the child nodes.
        self.base = SKShapeNode.init(rectOf: CGSize(width: self.baseSize, height: self.baseSize), cornerRadius: CGFloat(self.baseSize / 2))
        self.base.alpha = 0
        
        self.stick = SKShapeNode.init(rectOf: CGSize(width: self.stickSize, height: self.stickSize), cornerRadius: CGFloat(self.stickSize / 2))
        self.stick.alpha = 0
        
        // Super init.
        super.init()
        
        // Add the child nodes.
        self.addChild(self.base)
        self.addChild(self.stick)
    }
    
    /**
     Required init.
     */
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Enables the joystick.
     */
    func enable(location: CGPoint) {
        
        // Update the joystick.
        self.active = true;
        
        // Show the joystick.
        self.stick.alpha = 0.6
        self.base.alpha = 0.6
        
        // Move the joystick.
        self.base.position = CGPoint( x: location.x, y: location.y);
        self.stick.position = CGPoint( x: location.x, y: location.y);
    }

    /**
     Disabled the joystick.
     */
    func disable() {
        
        // Update the joystick.
        self.active = false
        
        // Show the joystick.
        self.stick.alpha = 0
        self.base.alpha = 0
    }
    
    /**
     Updates the joystick.
     */
    func update(location: CGPoint) {
        
        // Set degrees.
        let vector = CGVector(dx: location.x - self.base.position.x, dy: location.y - self.base.position.y)
        let angle = atan2(vector.dx, vector.dy)
        let length = self.base.frame.size.height/2
        
        self.degrees = angle * 180 / CGFloat(Double.pi);
        if self.degrees < 0 {
            self.degrees += 360;
        }
        
        // Move the stick.
        if self.base.frame.contains(location) {
            
            self.stick.position = location;
        } else {
            
            let xDist = sin(angle) * length;
            let yDist = cos(angle) * length;
            
            self.stick.position = CGPoint(x: self.base.position.x + xDist, y:  self.base.position.y + yDist);
        }
    }
    
    /**
     Gets the active status.
     */
    func getActive() -> Bool {
        return self.active;
    }

    /**
     Gets the joystick degress.
     */
    func getDegrees() -> CGFloat {
        return self.degrees;
    }

}
