//
//  Random.swift
//  Salamander Suzy
//
//  Created by Iman Lintag on 7/10/17.
//  Copyright © 2017 Iman Lintag. All rights reserved.
//

import Foundation

class Random {
    
    static let maximumInteger = UInt32.max
    
    static func random(_ number : UInt32) -> UInt32 {
        return arc4random_uniform(number)
    }
    
    static func numberFromZeroToOne() -> (Double) {
        return Double(random(maximumInteger))/Double(maximumInteger)
    }
    
    static func randomBounded(_ min: Double, max: Double) -> Double {
        let amplitude = max - min
        let offset = min
        return offset + amplitude * Random.numberFromZeroToOne()
    }
    
}
