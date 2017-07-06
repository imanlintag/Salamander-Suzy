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
    
    var movingGround: MLMovingGround!
    var hero: MLHero!
    var cloudGenerator: MLCloudGenerator!
    var wallGenerator: MLWallGenerator!
    
    var isStarted = false
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244/255.0, alpha: 1.0)
        
        // add ground
        movingGround = MLMovingGround(size: CGSize(width: view.frame.size.width, height: kMLGroundHeight))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height/2)
        addChild(movingGround)
        
        // add hero
        hero = MLHero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breathe()
        
        // add cloud generator
        cloudGenerator = MLCloudGenerator(color: UIColor.clear, size: view.frame.size)
        cloudGenerator.position = view.center
        addChild(cloudGenerator)
        cloudGenerator.populate(num: 7)
        cloudGenerator.startGeneratingWithSpawnTime(seconds: 5)
        
        // add wall generator
        wallGenerator = MLWallGenerator(color: UIColor.clear, size: view.frame.size)
        wallGenerator.position = view.center
        addChild(wallGenerator)
        
        // add start label
        let tapToStartLabel = SKLabelNode(text: "Tap to start!")
        tapToStartLabel.name = "tapToStartLabel"
        tapToStartLabel.position.x = view.center.x
        tapToStartLabel.position.y = view.center.y + 40
        tapToStartLabel.fontName = "Helvetica"
        tapToStartLabel.fontColor = UIColor.black
        tapToStartLabel.fontSize = 22.0
        
        addChild(tapToStartLabel)
    }
    
    func start() {
        isStarted = true
        
        let tapToStartLabel = childNode(withName: "tapToStartLabel")
        tapToStartLabel?.removeFromParent()
        
        hero.startRunning()
        movingGround.start()
        
        wallGenerator.startGeneratingWallsEvery(seconds: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isStarted {
            start()
        } else {
            hero.flip()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
