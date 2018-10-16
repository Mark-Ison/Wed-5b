// Created on: Sept 2018
// Created by: Mark Ison
// Created for: ICS3CR
// This program is a SpriteKit template for multiple scene of space invader

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let splashScendBackground = SKSpriteNode(imageNamed:"splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
      
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        splashScendBackground.name = "Splash Scene Background"
        splashScendBackground.position = CGPoint(x:(frame.size.width/2) , y:(frame.size.height/2))
        splashScendBackground.size = CGSize (width: frame.size.width, height: frame.size.height)
        self.addChild(splashScendBackground)
        
        splashScendBackground.run(moveToNextSceneDelay) {
            
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
            
        }
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // 
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let startButton = SKSpriteNode(imageNamed: "start.png")
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        startButton.name = "start button"
        startButton.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        self.addChild(startButton)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "start button" {
                let mainGameScene = MainGameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainGameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        let mothership = SKSpriteNode(imageNamed: "spaceShip.png")
        mothership.position = CGPoint(x:(frame.size.width/2) , y: 100)
        mothership.name = "Mother Ship"
        self.addChild(mothership)
        mothership.setScale(0.60)
        
        let enemyship1 = SKSpriteNode(imageNamed: "alien.png")
        enemyship1.position = CGPoint(x:(frame.size.width/3) , y: 450)
        enemyship1.name = "Enemy Ship 1"
        self.addChild(enemyship1)
        enemyship1.setScale(0.60)
        
        let enemyship2 = SKSpriteNode(imageNamed: "alien.png")
        enemyship2.position = CGPoint(x:(frame.size.width/2) , y: 300)
        enemyship2.name = "Enemy Ship 2"
        self.addChild(enemyship2)
        enemyship2.setScale(0.60)
        
        mothership.run(SKAction.playSoundFileNamed("Barrel.Exploding.wav", waitForCompletion: false))
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let mainMenuScene = MainMenuScene(size: self.size)
        self.view!.presentScene(mainMenuScene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)

scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
