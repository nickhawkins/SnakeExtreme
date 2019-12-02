//
//  MenuScene.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 02/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation
import GameplayKit

/**
 The menu scene.
 */
class MenuScene: SKScene {
 
    /**
     Private variables.
     */
    private var title: Label?
    private var play: Button?
    
    /**
     Override did move to view.
     */
    override func didMove(to view: SKView) {
        
        // Set up the title label.
        self.title = Label(text: "Snake", fontSize: 40, textColour: UIColor.white)
        self.title!.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.6)
        addChild(self.title!)
        
        // Set up the single player button.
        self.play = Button(height: self.frame.height / 10, width: self.frame.width - 30, text: "Play", buttonAction: goToGame)
        self.play!.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 3)
        addChild(self.play!)
    }
    
    /**
     Goes to the game.
     */
    func goToGame(){
        
        let reveal = SKTransition.crossFade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        self.view?.presentScene(gameScene, transition: reveal)
    }
    
}
