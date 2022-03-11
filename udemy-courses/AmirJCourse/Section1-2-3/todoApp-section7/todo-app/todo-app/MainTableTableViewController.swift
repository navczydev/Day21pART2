//
//  MainTableTableViewController.swift
//  todo-app
//
//  Created by NAVJOT SINGH on 2022-03-03.
//

import UIKit

class MainTableTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var textFiled: UITextField!
    
    var activeItems:[Item] = []
    var doneItems:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // populate default list
        AppData.populate()
        seprateItems()
        
        tableView.tableHeaderView = headerView
        self.textFiled.delegate = self
        self.textFiled.autocapitalizationType = .words
        
        // show the icon of editing
        //  self.tableView.isEditing =  true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Active Items"
        }else{
            return "Done Items"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return activeItems.count
        }else{
            return doneItems.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoitem", for: indexPath)
        
        
        //let item = AppData.items[indexPath.row]
        var  item = Item()
        
        if indexPath.section == 0{
            item = activeItems[indexPath.row]
        }else{
            item = doneItems[indexPath.row]
        }
        
        let attrStr = NSMutableAttributedString(string: item.name)
        
        
        if item.status{
            attrStr.addAttribute(.strikethroughStyle, value: 2.0, range: NSMakeRange(0, attrStr.length))
            cell.backgroundColor = .lightGray
            cell.accessoryType = .checkmark
            
        }else{
            cell.backgroundColor = .white
            cell.accessoryType = .none
        }
        
        cell.textLabel?.attributedText = attrStr
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var item = Item()
        
        if indexPath.section == 0{
            item = activeItems[indexPath.row]
            activeItems.remove(at: indexPath.row)
            item.status = true
            self.tableView.deleteRows(at: [indexPath], with: .left)
            doneItems.append(item)
            self.tableView.insertRows(at: [IndexPath(row: doneItems.count-1, section:1)], with:   .right)
        }else{
            item = doneItems[indexPath.row]
            doneItems.remove(at: indexPath.row)
            item.status = false
            self.tableView.deleteRows(at: [indexPath], with: .left)
            activeItems.append(item)
            self.tableView.insertRows(at: [IndexPath(row: activeItems.count-1, section:0)], with:   .right)
        }
        
        
        for i in 0..<AppData.items.count-1{
            if AppData.items[i].name == item.name{
                AppData.items[i] = item
            }
        }
        
       // var item = AppData.items[indexPath.row]
       // item.status = !item.status
       // AppData.items[indexPath.row] = item
       // self.tableView.reloadData()
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        //        switch reason {
        //        case UITextField.DidEndEditingReason.committed:
        //            <#code#>
        //        default:
        //            <#code#>
        //        }
        
        print("Textfield editing done \(textField.text ?? "/?" )")
        // textField.text = ""
        // textField.placeholder = "Add note"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Editing begins.....")
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // process the data
        if let validInput = textField.text{
            
            if validInput.isEmpty{
                print("No input")
                textField.placeholder = "Add note"// create new item and add to list
            }else{
                textField.text = ""
                textField.placeholder = "Add note"// cr
                
                for i in 0..<AppData.items.count {
                    let item = AppData.items[i]
                    if item.name.lowercased() == validInput.lowercased(){
                        var refreshedItem = item
                        refreshedItem.status = false
                        AppData.items.remove(at: i)
                        AppData.items.insert(refreshedItem, at: i)
                        self.tableView.reloadData()
                        return true
                    }
                }
                
                let item = Item(name: validInput, status: false)
                activeItems.append(item)
                //seprateItems()
                // it's expensaive I guess
                // self.tableView.reloadData()
                self.tableView.beginUpdates()
                let index = IndexPath(row: activeItems.count - 1, section: 0)
                self.tableView.insertRows(at: [index], with: .right)
                self.tableView.endUpdates()
                
            }
            return true
        }else{
            return false
        }
        
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        if indexPath.row == AppData.items.count - 2 {
    //
    //            return .insert
    //
    //        }else{
    //            return .delete
    //        }
    //    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // needs to done before
            AppData.items.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .left)
        } else if editingStyle == .insert {
            print("Insert action")
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
