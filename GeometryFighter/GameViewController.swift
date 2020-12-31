//
//  GameViewController.swift
//  GeometryFighter
//
//  Created by rkwright on 12/30/20.
//

import UIKit
import SceneKit

class GameViewController: UIViewController {
    var scnView: SCNView!
    var scnScene: SCNScene!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupScene()
  }

  override var shouldAutorotate: Bool {
    return true
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
    
    func setupView() {
      scnView = self.view as! SCNView
    }

    func setupScene() {
      scnScene = SCNScene()
      scnView.scene = scnScene
        
      scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"

    }

}
