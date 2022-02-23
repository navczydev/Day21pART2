//
//  Second_VC.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-14.
//

import Foundation
import UIKit

class Second_VC:UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var labelText = "Default"
    
    let langugaes = ["Kotlin", "Java", "Swift"]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tologin"{
            let nextVC = segue.destination as! Second_VC
            nextVC.labelText = "Hello set from segue"
            
        }else if segue.identifier == "number2"{
            let nextVC = segue.destination as! Container_VCViewController
            nextVC.name = "Second VC"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   label.text = labelText
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 3)
        
        scrollView.delegate = self
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("drag begin")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("dra stop")
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
