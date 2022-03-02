//
//  Container_VCViewController.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-23.
//

import UIKit

class Container_VCViewController: UIViewController {
    
  

    @IBOutlet weak var label: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Name \(name)")
        label.text = name
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
