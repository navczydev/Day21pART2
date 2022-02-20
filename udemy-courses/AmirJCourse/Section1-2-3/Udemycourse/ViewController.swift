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
    
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func SegmentedAction(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            label1.text = "Swift"
        case 1:
            label1.text = "Kotlin"
        case 2:
            label1.text = "Java"
        default:
            label1.text = "Default"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tologin"{
            let nextVC = segue.destination as! Second_VC
            nextVC.labelText = "Hello set from segue"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // sender is who trigger it
    @IBAction func buttonAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor.red
        sender.setTitleColor(UIColor.yellow, for: UIControl.State.selected)
        
        
    }
    
    //hard-coded outlets
    
    
}

