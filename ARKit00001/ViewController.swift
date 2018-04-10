//
//  ViewController.swift
//  ARKit00001
//
//  Created by sunkang on 2018/4/9.
//  Copyright © 2018年 sunkang. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let texture = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()

        //添加中心
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "WechatIMG3212.jpeg")
        sphere.materials = [material]
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(0,-1,-1.5)
        sphereNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        sphereNode.geometry?.firstMaterial?.lightingModel = .constant
        scene.rootNode.addChildNode(sphereNode)
        
    
        //添加环
        let tube = SCNTube(innerRadius: 0.5, outerRadius: 0.5, height: 0.001)
        let tubeMaterial = SCNMaterial()
        tubeMaterial.diffuse.contents = UIColor.white
        tube.materials = [tubeMaterial]
        let tubeNode = SCNNode(geometry: tube)
        tubeNode.position = SCNVector3(0,0,0)
        tubeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        tubeNode.geometry?.firstMaterial?.lightingModel = .blinn
        sphereNode.addChildNode(tubeNode)

     
        //添加围绕
        let yue = SCNSphere(radius: 0.1)
        let yueMaterial = SCNMaterial()
        yueMaterial.diffuse.contents = UIImage(named: "WechatIMG3212.jpeg")
        yue.materials = [yueMaterial]
        
    
        let yueNode1 = SCNNode(geometry: yue)
        yueNode1.position = SCNVector3(0,0,-0.5)
        yueNode1.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        yueNode1.geometry?.firstMaterial?.lightingModel = .blinn
        
        let yueNode2 = SCNNode(geometry: yue)
        yueNode2.position = SCNVector3(0,0,0.5)
        yueNode2.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        yueNode2.geometry?.firstMaterial?.lightingModel = .blinn
        
        let yueNode3 = SCNNode(geometry: yue)
        yueNode3.position = SCNVector3(0.5,0,0)
        yueNode3.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        yueNode3.geometry?.firstMaterial?.lightingModel = .blinn
        
        let yueNode4 = SCNNode(geometry: yue)
        yueNode4.position = SCNVector3(-0.5,0,0)
        yueNode4.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1)))
        yueNode4.geometry?.firstMaterial?.lightingModel = .blinn
        
        tubeNode.addChildNode(yueNode1)
        tubeNode.addChildNode(yueNode2)
        tubeNode.addChildNode(yueNode3)
        tubeNode.addChildNode(yueNode4)

        
        reisterstureReconizers()
        // Set the scene to the view
        sceneView.scene = scene
    }
    private func reisterstureReconizers(){
        let shoushi = UITapGestureRecognizer(target: self, action: #selector(aaaaaaaaaaaaaaa))
        view.addGestureRecognizer(shoushi)
    }
    
    @objc
    func aaaaaaaaaaaaaaa(canshuname:UITapGestureRecognizer)  {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
}
