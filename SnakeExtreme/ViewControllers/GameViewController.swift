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
import GoogleMobileAds

/**
 The game view controller.
 */
class GameViewController: UIViewController, GADBannerViewDelegate {
    
    /**
     Private variables.
     */
    private var bannerView: GADBannerView!

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
            
            // Set up the ad banner.
            self.bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            self.bannerView.adUnitID = "ca-app-pub-1013036252774367~9639512020"
            self.bannerView.rootViewController = self
            self.bannerView.load(GADRequest())
            self.bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints([NSLayoutConstraint(item: self.bannerView, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .top, multiplier: 1, constant: 0), NSLayoutConstraint(item: self.bannerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
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
