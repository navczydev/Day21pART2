//
//  Tile.swift
//  section9-memory-game
//
//  Created by NAVJOT SINGH on 2022-03-13.
//

import Foundation
import UIKit

class Tile:UILabel{
    var internalNum : Int!
    var status:TileState = .UNKNOWN
    
    func updateTileNum(){
        self.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        self.textAlignment = .center
        // self.text = String(internalNum)
        
        switch status {
            
        case .FOUND:
            UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.text = "😊"
                self.backgroundColor = .green
            }, completion: nil)
            
            
        case .FLIPPED:
            UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.text = String(self.internalNum)
                self.backgroundColor = .red
            }, completion: nil)
            
            
        default:
            self.text = "?"
            self.backgroundColor = .gray
        }
        
    }
}

enum TileState{
    case UNKNOWN, FOUND, FLIPPED
}
