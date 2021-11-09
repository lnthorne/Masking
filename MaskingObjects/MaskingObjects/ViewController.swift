//
//  ViewController.swift
//  MaskingObjects
//
//  Created by Liam Thorne on 2021-07-21.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Sun node
        let sun = SCNNode()
        sun.geometry = SCNSphere(radius: 0.35)
        sun.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "sunDiffuse")
        sun.position = SCNVector3(0, -0.5, -3)
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        let mercuryParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        mercuryParent.position = sun.position
        let mercuryNode = planetCreator(geomatry: SCNSphere(radius: 0.01223), diffuse: UIImage(imageLiteralResourceName: "mercury"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(0.7, 0, 0))
        
        
        let venusParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        venusParent.position = sun.position
        let venusNode = planetCreator(geomatry: SCNSphere(radius: 0.0304), diffuse: UIImage(imageLiteralResourceName: "venus"), specular: nil, emmision: UIImage(imageLiteralResourceName: "venusAtmo"), normal: nil, position: SCNVector3(1, 0, 0))
        
        let earthParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        earthParent.position = sun.position
        let earthNode = planetCreator(geomatry: SCNSphere(radius: 0.03204), diffuse: UIImage(imageLiteralResourceName: "earth day"), specular: UIImage(imageLiteralResourceName: "earthSpecular"), emmision: UIImage(imageLiteralResourceName: "earthClouds"), normal: UIImage(imageLiteralResourceName: "earthNormal"), position: SCNVector3(1.5, 0, -1.1))
       
        
        let moonNode = planetCreator(geomatry: SCNSphere(radius: 0.01), diffuse: UIImage(imageLiteralResourceName: "moon"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(-0.025, 0.027, -0.21))
        
        let marsParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        marsParent.position = sun.position
        let marsNode = planetCreator(geomatry: SCNSphere(radius: 0.0169), diffuse: UIImage(imageLiteralResourceName: "mars"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(1.7, 0, 0.09))
        
        let jupiterParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        jupiterParent.position = sun.position
        let jupiterNode = planetCreator(geomatry: SCNSphere(radius: 0.359), diffuse: UIImage(imageLiteralResourceName: "jupiter"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(2.5, 0, 0.1))
        
        let saturnParent = SCNNode()
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        saturnParent.position = sun.position
        let saturnNode = planetCreator(geomatry: SCNSphere(radius: 0.25), diffuse: UIImage(imageLiteralResourceName: "saturn"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(3.4, 0, 0.09))
        
        let saturnRing = SCNNode()
        saturnRing.geometry = SCNTube(innerRadius: 0.3, outerRadius: 0.4, height: 0.005)
        saturnRing.position = SCNVector3(0, 0, 0)
        saturnRing.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "saturnRing")
        saturnNode.addChildNode(saturnRing)
        // make saturn spin and rotate around sun still
        
      // creating rotations
        let sunRotate = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        
        let sunForever = SCNAction.repeatForever(sunRotate)
        sun.runAction(sunForever)
        
        let mercuryRotate = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 11)
        let mercuryForever = SCNAction.repeatForever(mercuryRotate)
        mercuryParent.runAction(mercuryForever)
        
        let venusRotate =  SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 13)
        let venusForever = SCNAction.repeatForever(venusRotate)
        venusParent.runAction(venusForever)
        
        let earthRotate =  SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 16)
        let earthForever = SCNAction.repeatForever(earthRotate)
        earthParent.runAction(earthForever)
        
        let marsRotate = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        let marsForever = SCNAction.repeatForever(marsRotate)
        marsParent.runAction(marsForever)
        
        let jupiterRotate = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 24)
        let jupiterForever = SCNAction.repeatForever(jupiterRotate)
        jupiterParent.runAction(jupiterForever)
        
        
        let saturnRotate = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        let saturnForever = SCNAction.repeatForever(saturnRotate)
        saturnParent.runAction(saturnForever)
        
        earthNode.runAction(earthForever)
        venusNode.runAction(venusForever)
        moonNode.runAction(earthForever)
        saturnNode.runAction(saturnForever)
        mercuryNode.runAction(mercuryForever)
        marsNode.runAction(marsForever)
        jupiterNode.runAction(jupiterForever)
        
        
        
        

        earthParent.addChildNode(earthNode)
        venusParent.addChildNode(venusNode)
        saturnParent.addChildNode(saturnNode)
        earthNode.addChildNode(moonNode)
        mercuryParent.addChildNode(mercuryNode)
        marsParent.addChildNode(marsNode)
        jupiterParent.addChildNode(jupiterNode)
         
    }
    
    func planetCreator(geomatry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emmision: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geomatry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emmision
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }


}

extension Int {
    var degreesToRadians: Double {return Double(self) * .pi/180}
}

