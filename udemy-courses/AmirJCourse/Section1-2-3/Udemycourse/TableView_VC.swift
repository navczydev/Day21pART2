//
//  TableView_VC.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-20.
//

import Foundation
import UIKit

class TableView_vc:ViewController, UITableViewDelegate, UITableViewDataSource{
    
    var countries = ["CANADA", "US", "PUNJAB", "Pakistan", "QUEBEC", "NewZeaLand", "Australia"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseTitle")
        //cell?.textLabel?.text = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseTitle") as! TableViewCell
        
        cell.label1.text = "Lable1"
        cell.label2.text = "Label2"
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected \(countries[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //if-else
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)

        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Are you sure?"
    }
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tologin"{
            let nextVC = segue.destination as! Second_VC
            nextVC.labelText = "Hello set from segue"
            
        }else if segue.identifier == "secondvc"{
            let nextVC = segue.destination as! Container_VCViewController
            nextVC.name = "Second VC"
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
