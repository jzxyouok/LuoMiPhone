//
//  MasonryTableViewCell.swift
//  LuoMiPhone
//
//  Created by Tim Geng on 4/9/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

import UIKit

@objc class MasonryTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
    
@IBOutlet var collectionView: UICollectionView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView .registerNib(UINib(nibName: "MasonryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MasonryCollectionViewCellIdentifier");
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 7;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell : MasonryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MasonryCollectionViewCellIdentifier", forIndexPath: indexPath) as MasonryCollectionViewCell
        return cell;
    }
    
}
