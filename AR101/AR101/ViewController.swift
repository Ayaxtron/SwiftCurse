//
//  ViewController.swift
//  AR101
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 3/11/19.
//  Copyright © 2019 Ayax Alexis. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        //sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin];
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        /*
        //Para crear cubo:
        let scene = SCNScene();
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0); let material = SCNMaterial();
        material.diffuse.contents = UIColor.blue
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(x: 0, y: 0, z:-1); scene.rootNode.addChildNode(node);
        //Para crear texto
        let scene = SCNScene()
        let texto = SCNText(string: "Hola Mundo", extrusionDepth: 0.2); texto.firstMaterial?.diffuse.contents = UIColor.black
        let node = SCNNode(geometry: texto); node.position = SCNVector3(x:0,y:-1.0,z:-2.0); node.scale = SCNVector3(0.02, 0.02, 0.02); scene.rootNode.addChildNode(node)
        */
        
        
        // Set the scene to the view
        sceneView.scene = scene
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
