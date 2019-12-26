//
//  GameScene.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 01/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The game scene.
 */
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    /**
     Private variables.
     */
    private var player: Player?
    
    /**
     Did move to view.
     */
    override func didMove(to view: SKView) {
        
        // Super.
        super.didMove(to: view)
        
        // Set up the player.
        self.player = Player(position: CGPoint(x: view.frame.width / 2, y: view.frame.height / 2))
        self.addChild(self.player!)
    }
    
    /**
     The update function.
     */
    override func update(_ currentTime: TimeInterval) {
        
        // Update the player.
        self.player?.update(currentTime: currentTime)
    }
    
    /**
     Touch began.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            // Enable the joystick.
            self.player?.touchBeganAt(location: touch.location(in: self))
        }
    }
    
    /**
     Touch Moved.
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            // Move the joystick.
            self.player?.touchMovedTo(location: touch.location(in: self))
        }
    }
    
    /**
     Touched ended.
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Disable the joystick.
        self.player?.touchEnded()
    }
    
    /**
     Touch cancelled.
     */
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Disable the joystick.
        self.player?.touchEnded()
    }
    
}
