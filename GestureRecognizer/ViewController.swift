//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Alumno on 9/03/17.
//  Copyright © 2017 JorgeLimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contenedor: UIView!
    var tipo:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(tipo);
        
        switch (tipo) {
        
            case "UITapGestureRecognizer":
                let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
                tabGestureRecognizer.numberOfTapsRequired = 2
                contenedor.addGestureRecognizer(tabGestureRecognizer)
                break;
            case "UIPinchGestureRecognizer":
                print("-->")
                let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchTemp))
                pinchGestureRecognizer.scale = 2
                contenedor.addGestureRecognizer(pinchGestureRecognizer)
                break;
            
            case "UIRotationGestureRecognizer":
                let rotationGEstureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation))
                
                    contenedor.addGestureRecognizer(rotationGEstureRecognizer)
                break;
            case "UISwipeGestureRecognizer":
                let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(deleteTemp))
                
                swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
                swipeGestureRecognizer.numberOfTouchesRequired = 2
                
                contenedor.addGestureRecognizer(swipeGestureRecognizer)
                
                break;
            case "UIPanGestureRecognizer":
                
                let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction))
                panGestureRecognizer.minimumNumberOfTouches = 1
                panGestureRecognizer.maximumNumberOfTouches = 3
                contenedor.addGestureRecognizer(panGestureRecognizer)
                break;
            
            case "UIScreenEdgeGestureRecognizer":
                let screenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdge))
                screenEdgePanGestureRecognizer.edges = UIRectEdge.right
                self.view.addGestureRecognizer(screenEdgePanGestureRecognizer)
                //contenedor.addGestureRecognizer(screenEdgePanGestureRecognizer)
                break;
            case "UILongPressGestureRecognizer":
                let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longAction))
                longPressGestureRecognizer.minimumPressDuration = 3//seg
                longPressGestureRecognizer.numberOfTapsRequired = 1//número de veces que se debe tocar antes de dejar el long press
                longPressGestureRecognizer.numberOfTouchesRequired = 1
                contenedor.addGestureRecognizer(longPressGestureRecognizer)
                break;
        default:
                break;
            
        }
        
    }
    
    func longAction(sender: UILongPressGestureRecognizer){
        print("long press")
    }
    
    func screenEdge(sender:UIScreenEdgePanGestureRecognizer) {
        print("screen edge!");
    }
    
    func panAction(sender:UIPanGestureRecognizer) {
        print("Transalation: \(sender.translation(in: contenedor))")
        
    }
    
    func deleteTemp(sender:UISwipeGestureRecognizer) {
        print("swipe")
    }
    
    func rotation(sender: UIRotationGestureRecognizer) {
        if (sender.rotation > 2) {
            print("rotation")
        } else {
            print("rotation: \(sender.rotation)")
            print("velocidad \(sender.velocity)")
        }
    }
    func tap() {
        print("tap")
    }
    func pinchTemp(sender: UIPinchGestureRecognizer) {
        print("pinch")
        print("scale: \(sender.scale)")
        print("velocidad \(sender.velocity)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

