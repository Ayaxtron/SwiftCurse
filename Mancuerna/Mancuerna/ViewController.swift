//
//  ViewController.swift
//  Mancuerna
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 4/1/19.
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
        
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/mancuerna.dae")!
        
        // Set the scene to the view
        //sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        guard let imagenesMarcador = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)else{
            fatalError("No se encontró la imagen marcadora")
        }
        configuration.trackingImages = imagenesMarcador
        // Run the view's session
        sceneView.session.run(configuration)
        
        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            if let anchor = anchor as? ARImageAnchor{
                let imagenReferencia = anchor.referenceImage
                agregarModelo(to: node, refImage: imagenReferencia)
            } }
          func agregarModelo(to node:SCNNode, refImage:ARReferenceImage ){
            DispatchQueue.global().async {
                let escenaModelo = SCNScene(named: "art.scnassets/mancuerna.dae")!
                //encontrar el nodo principal: Brazalete
                let nodoPrincipal = escenaModelo.rootNode.childNode(withName: "mancuerna", recursively: true)!
                node.addChildNode(nodoPrincipal)
                
            }
        }
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
