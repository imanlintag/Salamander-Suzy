//
//  GameScene.swift
//  Salamander Suzy
//
//  Created by Iman Lintag on 6/30/17.
//  Copyright © 2017 Iman Lintag. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var movingGround: MLMovingGround!
    var hero: MLHero!
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244/255.0, alpha: 1.0)
        
        movingGround = MLMovingGround(size: CGSize(width: view.frame.size.width, height: 20))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2)
        addChild(movingGround)
        
        hero = MLHero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breathe()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hero.stop()
        hero.startRunning()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
