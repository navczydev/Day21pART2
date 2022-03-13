//
//  ViewController.swift
//  section8
//
//  Created by NAVJOT SINGH on 2022-03-11.
//

import UIKit

@IBDesignable class CustomView: UIView{
    
    override func prepareForInterfaceBuilder() {
        self.backgroundColor = UIColor.green
    }
    
    @IBInspectable var cornerRadius : CGFloat = 2.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var customView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //customView.isHidden = false
        // Do any additional setup after loading the view.
        
        redView.isHidden = false
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        let scaleGesture = UIPinchGestureRecognizer(target: self, action: #selector(scale))
        
        redView.addGestureRecognizer(longPressGesture)
        redView.addGestureRecognizer(rotationGesture)
        redView.addGestureRecognizer(scaleGesture)
        
        redView.layer.cornerRadius = 4.0
        redView.layer.borderColor = UIColor.yellow.cgColor
        redView.layer.borderWidth = 5.0
        
        // create layer and add it as a sublayer
        let subLayer = CALayer()
        subLayer.frame = redView.bounds.insetBy(dx: 20.0, dy: 20.0)
        subLayer.backgroundColor = UIColor.gray.cgColor
        subLayer.shadowColor = UIColor.black.cgColor
        subLayer.shadowOpacity = 0.8
        subLayer.shadowOffset = CGSize(width: 5, height: 5)
        redView.layer.addSublayer(subLayer)
        // ibdesignable immediatly show efect in storyboard
        // ibinspectable makes the property findable by storyboard
       
    }
    
    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        print("\(sender.rotation)")
        print("\(sender.velocity)")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // later
        // transition
        UIView.transition(with: self.redView, duration: 1.5, options: .transitionFlipFromLeft, animations: {
            self.redView.backgroundColor = UIColor.green
        }, completion: { (res) in
            self.redView.backgroundColor = UIColor.red
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch =  touches.first
        
        if touch?.view == redView{
            // redView.removeFromSuperview()
            print("touch ended")
            
            UIView.animate(withDuration: 2.0){
                self.redView.alpha = 0.0
                
            } completion: { (res) in
                // run on completion
                UIView.animate(withDuration: 4.0, animations: {
                    self.redView.alpha = 1.0
                    //                    self.redView.
                })
            }
        }
        
        //redView.transform = redView.transform.translatedBy(x: 20.0, y: 30.0)
        // redView.transform = redView.transform.rotated(by: 30.0 * CGFloat.pi / 180.0)
        // redView.transform = redView.transform.scaledBy(x: 2.0, y: 5.0)
        
        // reset transformations
        //        redView.transform  = CGAffineTransform.identity
        // concat transformation
        let rotatedTransFormation = CGAffineTransform(rotationAngle: 90.0)
        let scaledTransFormation = CGAffineTransform(scaleX: 2.0, y: 4.0)
        
        // applies once not like by everyitme
        // redView.transform = rotatedTransFormation.concatenating(scaledTransFormation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // later
        
        if touches.count > 1 {return}
        
        let touch = touches.first
        
        if touch?.view != redView {
            return
        }
        
        //redView.center = touch?.location(in: self.view) ?? self.view.center
    }
    
    
    @objc func longPress(){
        print("Long press")
    }
    
    
    @objc func rotate(_ sender:UIRotationGestureRecognizer){
        redView.transform = redView.transform.rotated(by: sender.rotation)
        sender.rotation = 0.0
    }
    
    @objc func scale(_ sender:UIPinchGestureRecognizer){
        redView.transform = redView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
    }
    
    
}

