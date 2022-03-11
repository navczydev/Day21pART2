//
//  SeprateItems.swift
//  todo-app
//
//  Created by NAVJOT SINGH on 2022-03-07.
//

import Foundation

extension MainTableTableViewController{
    
    func seprateItems(){
        for item  in AppData.items {
            if item.status{
                doneItems.append(item)
            }else{
                activeItems.append(item)
            }
        }
    }
}
