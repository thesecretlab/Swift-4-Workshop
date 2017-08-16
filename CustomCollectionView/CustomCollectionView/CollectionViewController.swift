//
//  CollectionViewController.swift
//  CustomCollectionView
//
//  Created by Jon Manning on 10/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

// NOTE THE DRAG DELEGATE
class CollectionViewController: UICollectionViewController, UICollectionViewDragDelegate {
    
    
    let data = ["Lorem", "ipsum","dolor","sit","amet"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.dragInteractionEnabled = true
        self.collectionView?.dragDelegate = self

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .green
        
        // Configure the cell
    
        return cell
    }

    // DRAG AND DROP
    
    // Drag delegate method - drags a string
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        let datum = data[indexPath.item]
        
        let itemProvider = NSItemProvider(object: datum as NSString)
        itemProvider.suggestedName = "Text.txt"
        
        let dragItem = UIDragItem(itemProvider: itemProvider)
        
        return [dragItem]
        
    }

}
