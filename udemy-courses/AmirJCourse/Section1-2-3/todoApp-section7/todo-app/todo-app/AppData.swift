//
//  AppData.swift
//  todo-app
//
//  Created by NAVJOT SINGH on 2022-03-03.
//

import Foundation

class AppData{
    static var items: Array<Item>!
    
    class func populate(){
        items = [Item(name: "Milk", status: true), Item(name: "Egg", status: false)]
    }
}
