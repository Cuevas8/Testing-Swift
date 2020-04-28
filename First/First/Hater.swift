//
//  Hater.swift
//  First
//
//  Created by Bryan Cuevas on 4/27/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
