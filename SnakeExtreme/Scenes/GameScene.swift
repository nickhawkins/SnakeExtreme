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
class GameScene: SKScene {
    
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
    
}
