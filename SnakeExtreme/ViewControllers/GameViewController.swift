//
//  GameViewController.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 01/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

/**
 The game view controller.
 */
class GameViewController: UIViewController {

    /**
     Override view did load.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            // Show the menu scene.
            let scene = MenuScene()
            scene.size = self.view.bounds.size
            view.presentScene(scene)
        }
    }

    /**
     Overrides the should auto rotate.
     */
    override var shouldAutorotate: Bool {
        
        return false
    }
    
    /**
     Overrides the support interface option.
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    /**
     Overrides the status bard hidden.
     */
    override var prefersStatusBarHidden: Bool {
        
        return false
    }
}
