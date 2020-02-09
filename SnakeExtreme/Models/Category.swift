//
//  Category.swift
//  SnakeExtreme
//
//  Created by Nick Hawkins on 03/02/2020.
//  Copyright © 2020 Nick Hawkins. All rights reserved.
//

import Foundation

/**
 The categories constants.
 */
struct Category {
   
    static let headCategory: UInt32 = 0x1 << 1
    static let foodCategory: UInt32 = 0x1 << 2
    static let bodyCategory: UInt32 = 0x1 << 3
    static let boundsCategory : UInt32 = 0x1 << 4
}
