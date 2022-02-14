//
//  ViewController.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button:UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func SegmentedAction(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            label.text = "Swift"
        case 1:
            label.text = "Kotlin"
        case 2:
            label.text = "Java"
        default:
            label.text = "Default"
        }
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let box  = UIView(frame: CGRect.zero)
//        box.backgroundColor = UIColor.red
//        //self.view.addSubview(box)
//        box.translatesAutoresizingMaskIntoConstraints = false
//
//        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        box.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive =  true
//        box.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//        let widthConstraint = NSLayoutConstraint(item: box,
//                                                 attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: 150)
//        box.addConstraint(widthConstraint)
        
        let lable:UILabel = UILabel()
        label.text = "From code"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.brown
        
        let frame = CGRect(x: 20, y: 130, width: self.view.frame.size.width, height: 48)
        label.frame = frame
        
        // segmented controls = radio button, etc
        
        self.view.addSubview(lable)
    }
    
    // sender is who trigger it
    @IBAction func buttonAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor.red
        sender.setTitleColor(UIColor.yellow, for: UIControl.State.selected)
        
        
    }
    
    //hard-coded outlets
    
    
}

