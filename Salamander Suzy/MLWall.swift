//
//  MLWall.swift
//  Salamander Suzy
//
//  Created by Iman Lintag on 7/4/17.
//  Copyright © 2017 Iman Lintag. All rights reserved.
//

import Foundation
import SpriteKit

class MLWall: SKSpriteNode {
    
    init() {
        let size = CGSize(width: 30.0, height: 50.0)
        super.init(texture: nil, color: UIColor.black, size: size)
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = wallCategory
        physicsBody!.collisionBitMask = wallCategory | heroCategory
        physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
}
