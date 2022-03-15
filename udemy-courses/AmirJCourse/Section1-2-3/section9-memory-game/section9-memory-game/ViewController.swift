//
//  ViewController.swift
//  section9-memory-game
//
//  Created by NAVJOT SINGH on 2022-03-12.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cellWidth :CGFloat = 0.0
    @IBOutlet weak var gameCollectionView: UICollectionView!
    @IBOutlet weak var gameModeSegment: UISegmentedControl!
    @IBOutlet weak var timerLabel: UILabel!
    var tiles:Array<Tile> = []
    let flowLayout = UICollectionViewFlowLayout()
    var firstTile: Tile!
    var secondTile: Tile!
    var flipping = false
    var foundTiles:Array<Tile> = []
    var gameTime: Int = 0
    var gameTimer : Timer!
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameModeSegment.selectedSegmentIndex = 1
        self.view.layoutIfNeeded()
        self.gameCollectionView.layoutIfNeeded()
        
        cellWidth = gameCollectionView.bounds.width / CGFloat(4)
        
        //let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        flowLayout.minimumInteritemSpacing = 0.0
        
        flowLayout.minimumLineSpacing = 0.0
        
        gameCollectionView.collectionViewLayout = flowLayout
        
        timerLabel.text = "0\' : 00\""
        
        gameTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        self.resetButton(nil)
    }
    
    @objc func timerFunction(){
        print("timer fired")
        gameTime += 1
        
        let minutes = String( gameTime / 60)
        let seconds = String(format: "%02d", gameTime % 60)
        
        timerLabel.text = "\(minutes)\' : \(seconds)\""
    }
    
    
    @IBAction func gameSegmentViewAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            makeTile(size: 4)
            cellWidth = gameCollectionView.bounds.width / CGFloat(4)
        }else{
            makeTile(size: 6)
            cellWidth = gameCollectionView.bounds.width / CGFloat(6)
        }
        
        selectedIndex = sender.selectedSegmentIndex
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        self.gameCollectionView.reloadData()
        
        print("\(sender.selectedSegmentIndex)")
    }
    
    @IBAction func resetButton(_ sender: UIButton?) {
        print("reset clicked")
        gameTime = 0
        
        // make tiles based on the selectefd index
        if selectedIndex == 0{
            makeTile(size: 4)
            cellWidth = gameCollectionView.bounds.width / CGFloat(4)
        }else{
            makeTile(size: 6)
            cellWidth = gameCollectionView.bounds.width / CGFloat(6)
        }
        self.gameCollectionView.reloadData()
        firstTile = nil
        secondTile = nil
        foundTiles = []
        flipping = false
        
        
        
        //let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        flowLayout.minimumInteritemSpacing = 0.0
        
        flowLayout.minimumLineSpacing = 0.0
        
        gameCollectionView.collectionViewLayout = flowLayout
        
        gameTimer.invalidate()
        timerLabel.text = "0\' : 00\""
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        timerLabel.backgroundColor = .gray
    }
    
    func makeTile(size:Int){
        tiles = []
        
        let tileCount = size * size
        let halfOfTiles = tileCount / 2
        var counter = 0
        
        // 16
        if size == 4{
            for i in 1...tileCount{
                counter = i
                let tile = Tile()
                
                if counter > halfOfTiles{
                    counter = i - halfOfTiles
                }
                
                tile.internalNum = counter
                // tile.updateTileNum()
                tiles.append(tile)
            }
        }
        // 36
        else if size == 6{
            for i in 1...tileCount{
                counter = i
                let tile = Tile()
                
                if counter > halfOfTiles{
                    counter = i - halfOfTiles
                }
                
                tile.internalNum = counter
                // tile.updateTileNum()
                tiles.append(tile)
            }
        }
        
        print("tiles count: \(tiles.count)")
        
        tiles.shuffle()
    }
    
}

