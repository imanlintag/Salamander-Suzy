//
//  MLWallGenerator.swift
//  Salamander Suzy
//
//  Created by Iman Lintag on 7/4/17.
//  Copyright © 2017 Iman Lintag. All rights reserved.
//

import Foundation
import SpriteKit

class MLWallGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var walls = [MLWall]()
    var wallTracker = [MLWall]()
    
    func startGeneratingWallsEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(MLWallGenerator.generateWall), userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    func generateWall() {
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = -1.0
        } else {
            scale = 1.0
        }
        
        let wall = MLWall()
        wall.position.x = size.width/2 + wall.size.width/2
        wall.position.y = scale * (kMLGroundHeight/2 + wall.size.height/2)
        walls.append(wall)
        wallTracker.append(wall)
        addChild(wall)
    }
    
    func stopWalls() {
        stopGenerating()
        for wall in walls {
            wall.stopMoving()
        }
    }
}
