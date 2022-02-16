//
//  Second_VC.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-14.
//

import Foundation
import UIKit

class Second_VC:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    // how many pickers
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langugaes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return langugaes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("You selected \(langugaes[row])")
    }
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    
    var labelText = "Default"
    
    let langugaes = ["Kotlin", "Java", "Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = labelText
        
        picker.dataSource = self
        picker.delegate = self
        
    }
    
    @IBAction func datepickerAction(_ sender: UIDatePicker) {
        
        let date = sender.date
        let calendar = Calendar.current
        let day = calendar.component(Calendar.Component.day, from: date)
        print(day)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        print(formattedDate)
        let formatString = dateFormatter.date(from: "2020-12-23")
        print(formatString?.description)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
