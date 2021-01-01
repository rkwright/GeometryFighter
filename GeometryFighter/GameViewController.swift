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
    var cameraNode: SCNNode!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupScene()
    setupCamera()
    
    spawnShape()
  }

  override var shouldAutorotate: Bool {
    return true
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
    
    func setupView() {
      scnView = self.view as! SCNView
        
        // 1
        scnView.showsStatistics = true
        // 2
        scnView.allowsCameraControl = true
        // 3
        scnView.autoenablesDefaultLighting = true

    }

    func setupScene() {
      scnScene = SCNScene()
      scnView.scene = scnScene
        
      scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"

    }

    func setupCamera() {
      // 1
      cameraNode = SCNNode()
      // 2
      cameraNode.camera = SCNCamera()
      // 3
      cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
      // 4
      scnScene.rootNode.addChildNode(cameraNode)
    }

    func spawnShape() {
      
        var shapeNode:SCNNode
      
      switch ShapeType.random() {
        
        case ShapeType.sphere:
            let sphere = SCNSphere(radius: 1.0)
            shapeNode = SCNNode(geometry: sphere)

        case ShapeType.pyramid:
            let pyra = SCNPyramid(width: 1.0, height:1.0, length:1.0)
            shapeNode = SCNNode(geometry: pyra)
            
        case ShapeType.torus:
            let tor = SCNTorus(ringRadius: 1.0, pipeRadius:1.0)
            shapeNode = SCNNode(geometry: tor)
            
        case ShapeType.capsule:
            let caps = SCNCapsule(capRadius: 1.0, height:1.0)
            shapeNode = SCNNode(geometry: caps)
            
        case ShapeType.cylinder:
            let tor = SCNCylinder(radius: 1.0, height:1.0)
            shapeNode = SCNNode(geometry: tor)
            
        case ShapeType.cone:
            let con = SCNCone(topRadius: 0.2, bottomRadius:1.0, height:1.0)
            shapeNode = SCNNode(geometry: con)
            
        case ShapeType.tube:
            let tub = SCNTube(innerRadius: 0.5, outerRadius:1.0, height:1.0)
            shapeNode = SCNNode(geometry: tub)

        default:           // default is a ShapeType.box
            let box = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
            shapeNode = SCNNode(geometry: box)
     }
            
      scnScene.rootNode.addChildNode(shapeNode)
    }

}
