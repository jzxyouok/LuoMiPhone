//
//  MKMasonryViewLayout.swift
//  LuoMiPhone
//
//  Created by Tim Geng on 4/13/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

import UIKit

@objc protocol MKMasonryViewLayoutDelegate{

    func collectionView(collectionView:UICollectionView, layout:MKMasonryViewLayout, heightForItemAtIndexPath:NSIndexPath)->CGFloat;
}

class MKMasonryViewLayout: UICollectionViewLayout {

    var delegate:MKMasonryViewLayoutDelegate?;
    var interItemSpacing:Float = 12.5;
    var numberOfColumns:UInt = 3;
    var lastYValueForColumn = [Int: Double]();
    var layoutInfo = [Int: Double]();
    
  

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func prepareLayout(){
        let fullWidth:Float = Float(self.collectionView!.frame.size.width);
        let availableSpaceExcludingPadding = fullWidth  - (Float(numberOfColumns) + 1) * interItemSpacing;
        var itemWidth = 0;
        var indexPath:NSIndexPath;
        var numberSections = self.collectionView!.numberOfSections();
        for section in 0...numberSections{
            
        }
        
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        
    }
    
    override  func collectionViewContentSize() -> CGSize {
        
    }


}
