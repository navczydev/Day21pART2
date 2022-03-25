//
//  ViewController.swift
//  section11-debug-test
//
//  Created by NAVJOT SINGH on 2022-03-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        #warning("Do this before commit")
        print(#file, " Do something")
        print(#line, #column," check num")
        print(#function," Do something")
//        #error("Must do it")
        print("Start it")
        // TODO: - Let's do this by EOF
        print("Todo")
        // FIXME: - "Not critical"
        print("fix me")
        // MARK: - "Easy to navigate
        print("MARK")
        
        for i in 0...1000 {
            print("Number \(i)")
        }
    }

    @IBAction func action(_ sender: UIButton) {
        print("Clicked")
        label.text = "HELLO"
    }
    
}

