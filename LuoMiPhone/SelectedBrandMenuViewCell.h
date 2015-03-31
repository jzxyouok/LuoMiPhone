//
//  SelectedBrandMenuView.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedBrandMenuViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel *timeLabel;
@property(nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic,weak) IBOutlet UILabel *toEndLabel;
@end
