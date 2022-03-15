//
//  VC+CollectionViewDelegates.swift
//  section9-memory-game
//
//  Created by NAVJOT SINGH on 2022-03-13.
//

import Foundation
import UIKit

extension ViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellgame", for: indexPath)
        
        let currentTile = tiles[indexPath.row]
        
        currentTile.frame = CGRect(x: 2, y: 2, width: cellWidth - 4, height: cellWidth - 4)
        
        if cell.subviews.count > 0{
            for any in cell.subviews{
                any.removeFromSuperview()
            }
        }
        
        currentTile.updateTileNum()
        
        cell.addSubview(currentTile)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath)
        
        let tile = cell?.subviews[0] as! Tile
        
        if foundTiles.contains(tile) || flipping{
            return
        }
        
        if firstTile == nil{
            firstTile = tile
            firstTile.status = .FLIPPED
            firstTile.updateTileNum()
            flipping = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self] in
                self.flipping = false
            })
        }else{
            if firstTile != tile{
                secondTile = tile
                secondTile.status = .FLIPPED
                secondTile.updateTileNum()
                // compare tiles
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self] in
                    flipping = false
                    self.compare()
                })
            }
        }
        print("selcted item \(String(describing: tile.internalNum))")
    }
    
    func compare(){
        print("Compare tiles")
        if firstTile.internalNum == secondTile.internalNum{
            print("Tiles have same content")
            firstTile.status = .FOUND
            secondTile.status = .FOUND
            foundTiles.append(firstTile)
            foundTiles.append(secondTile)
            winVerify()
        }else{
            firstTile.status = .UNKNOWN
            secondTile.status = .UNKNOWN
        }
        
        firstTile.updateTileNum()
        secondTile.updateTileNum()
        
        firstTile = nil
        secondTile = nil
    }
    
    func winVerify(){
        print("win")
        if foundTiles.count == tiles.count{
            gameTimer.invalidate()
            timerLabel.text = "We won in \(gameTime/60)\' : \(gameTime%60)\""
            timerLabel.backgroundColor = .systemGreen
        }
    }
}
