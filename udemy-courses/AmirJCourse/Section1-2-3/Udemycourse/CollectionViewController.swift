//
//  CollectionViewController.swift
//  Udemycourse
//
//  Created by NAVJOT SINGH on 2022-02-26.
//

import UIKit

class CollectionViewController: ViewController, UICollectionViewDataSource {
    
    var list = ["Item1","item2","Item3","item4","item4"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! CollectionCellView
        
        cell.label.text = list[indexPath.row]
        cell.deleteButton.addTarget(self, action: #selector(deleteObject(_ :)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @objc func deleteObject(_ sender: UIButton){
        
        guard let cell = sender.superview?.superview as? UICollectionViewCell else{
            
            return}
        
        let path = collectionView.indexPath(for: cell)!
        
        collectionView.deleteItems(at: [path])
        list.remove(at: path.row)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Nav Singh")
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        collectionView.layoutIfNeeded()
        let cellWidth = self.collectionView.bounds.width/CGFloat(2)
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        collectionView.collectionViewLayout = layout
        
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
