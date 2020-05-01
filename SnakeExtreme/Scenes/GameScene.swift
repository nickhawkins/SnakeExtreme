//
//  GameScene.swift
//  SnakeExtreme
//
//  Created  by Nick Hawkins on 01/12/2019.
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
    private var bounds: Bounds?
    private var food: Food?
    private var gameOver = true
    private var scoreLabel: Label?
    private var score = 0
    
    /**
     Did move to view.
     */
    override func didMove(to view: SKView) {
        
        // Super.
        super.didMove(to: view)
        
        self.backgroundColor = UIColor.green
        
        // Set up the physics world.
        physicsWorld.contactDelegate = self;
        
        // Set up the player.
        self.player = Player(position: CGPoint(x: view.frame.width / 2, y: view.frame.height / 2))
        self.addChild(self.player!)
        
        // Set up the player.
        self.food = Food(bounds: view.frame)
        self.addChild(self.food!)
        
        // Set up the bounds.
        self.bounds = Bounds(rect: view.frame)
        self.addChild(self.bounds!)
        
        // Set up the score label.
        let topSpace = view.frame.height - ((UIApplication.shared.keyWindow?.safeAreaInsets.bottom)! + 20 + view.frame.height / 40)
        self.scoreLabel = Label(text: "0", fontSize:  30, textColour: UIColor.white)
        self.scoreLabel!.position = CGPoint(x: view.frame.width / 2, y: topSpace)
        self.addChild(self.scoreLabel!)
        
        // Start the game.
        self.startGame()
    }
    
    /**
     The update function.
     */
    override func update(_ currentTime: TimeInterval) {
        
        // Check the game is not over.
        if gameOver {
            return
        }
        
        // Update the player.
        self.player?.update(currentTime: currentTime)
        
        // Update the food.
        food?.update(currentTime: currentTime)
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
    
    /**
     Handle node contact.
     */
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody

        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
            
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else {
            
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        
        if firstBody.categoryBitMask == Category.headCategory && secondBody.categoryBitMask == Category.foodCategory {
            
            // Explode the power up.
            let emitter = SKEmitterNode(fileNamed: "Explode.sks")
            emitter!.position = secondBody.node!.position
            self.addChild(emitter!)
            
            // Add body part.
            self.player?.addBodyPart();

            // Remove the food.
            self.food?.removeFood(physicsBody: secondBody);
            
            // Update the score.
            self.updateScore()
        }
        else if firstBody.categoryBitMask == Category.headCategory && secondBody.categoryBitMask == Category.bodyCategory {

            // End the game.
            self.endGame()
        }
        else if firstBody.categoryBitMask == Category.headCategory && secondBody.categoryBitMask == Category.boundsCategory {

            // End the game.
            self.endGame()
        }
    }
    
    /**
     Ends the game.
     */
    func endGame() {
        
        // End the game.
        self.gameOver = true
        
        // Save the score.
        let bestScore = UserDefaults.standard.integer(forKey: "bestScore")
        if self.score > bestScore {
            UserDefaults.standard.set(self.score, forKey: "bestScore")
        }
        
        // Go to the menu scene.
        let reveal = SKTransition.crossFade(withDuration: 0.5)
        let menuScene = MenuScene(size: self.size)
        self.view?.presentScene(menuScene, transition: reveal)
    }
    
    /**
     Updates the score.
     */
    func updateScore() {
        
        self.score += 1
        self.scoreLabel?.setText(text: String(self.score))
    }
    
    /**
     Starts the game.
     */
    func startGame() {
        
        let label1 = Label(text: "3", fontSize: 300, textColour: UIColor.white)
        label1.position = CGPoint(x: self.view!.frame.width / 2, y: self.view!.frame.height / 2)
        label1.alpha = 0
        addChild(label1)
        
        let label2 = Label(text: "2", fontSize:  400, textColour: UIColor.white)
        label2.position = CGPoint(x: self.view!.frame.width / 2, y: self.view!.frame.height / 2 - (label2.frame.height / 2))
        label2.alpha = 0
        addChild(label2)

        let label3 = Label(text: "1", fontSize:  400, textColour: UIColor.white)
        label3.position = CGPoint(x: self.view!.frame.width / 2, y: self.view!.frame.height / 2 - (label3.frame.height / 2))
        label3.alpha = 0
        addChild(label3)

        let scale = SKAction.scale(to: 0.1, duration: 0.28)
        let fade = SKAction.fadeOut(withDuration: 0.18)
        let sequence = SKAction.sequence([scale, fade])

        label1.alpha = 1
        label1.run(sequence) {

            label2.alpha = 1;
            label2.run(sequence) {

                label3.alpha = 1;
                label3.run(sequence) {

                    // Start the game.
                    self.gameOver = false;

                    // Show the player.
                    self.player?.alpha = 1
                }
            }
        }
    }

}
