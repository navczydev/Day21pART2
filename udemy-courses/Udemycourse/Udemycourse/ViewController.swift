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
    
    @IBOutlet weak var viewcontainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // sender is who trigger it
    @IBAction func buttonAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor.red
        sender.setTitleColor(UIColor.yellow, for: UIControl.State.selected)
        
        // remove label from View
        label.removeFromSuperview()

    }
    
}

