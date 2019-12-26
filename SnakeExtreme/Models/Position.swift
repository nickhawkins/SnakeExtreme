//
//  Position.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 26/12/2019.
//  Copyright © 2019 Nick Hawkins. All rights reserved.
//

import Foundation

/**
 The position object.
 */
class Position : NSObject {
    
    /**
     Public properties
     */
    var xPosition: Double
    var yPosition: Double
    var zRotaion: Double
    
    /**
     Initialises a new position.
     */
    init(xPosition: Double, yPosition: Double, zRotaion: Double) {
        
        // Set the propeties.
        self.xPosition = xPosition
        self.yPosition = yPosition
        self.zRotaion = zRotaion
    }
}
