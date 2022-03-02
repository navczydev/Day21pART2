//
//  ViewController.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-08.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
            
        }else if segue.identifier == "containerView"{
            let nextVC = segue.destination as! Container_VCViewController
            nextVC.name = "Nav Singh"
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
    
    @IBAction func alertaction(_ sender: UIButton) {
        
        let alertDialog = UIAlertController(title: "Alert section", message: "Hi from Alert", preferredStyle: UIAlertController.Style.alert)
        //UIAlertController.Style.sheet
        
        alertDialog.addTextField{ (name) in
            name.isSecureTextEntry = true
            name.textAlignment = .center
            name.font = .systemFont(ofSize: 24)
            
            name.delegate = self
        }
        
        // okAction
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default)
        {
            (action) in
            
            let password = alertDialog.textFields![0].text
            print("Password is: \(password ?? "NA")")
            
            //            if(password?.isEmpty == true){
            //                action.isEnabled = false
            //
            //            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel){
            (cancel) in
            print("Cancelled")
        }
        
        alertDialog.addAction(okAction)
        alertDialog.addAction(cancelAction)
        
        self.present(alertDialog, animated: true, completion: nil)
        
    }
    //hard-coded outlets
    
    
}

