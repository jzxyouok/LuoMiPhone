//
//  MasonryTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/18/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "MasonryTableViewCell.h"
#import "MasonryCollectionViewCell.h"
#import "MKMasonryViewLayout.h"

@interface MasonryTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,MKMasonryViewLayoutDelegate>

@end

@implementation MasonryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.collectView registerNib:[UINib nibWithNibName:NSStringFromClass([MasonryCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"MasonryCollectionViewCellIdentifier"];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;

}

- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(MKMasonryViewLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath{
    if (indexPath.row == 0 || indexPath.row == 1) {
        return 130 * 2 + 3;
    }
    return 130;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MasonryCollectionViewCell *cell = (MasonryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MasonryCollectionViewCellIdentifier" forIndexPath:indexPath];
    if (indexPath.row ==0 ) {
        cell.imageView.image = [UIImage imageNamed:@"MasonryPic1"];
    }
    if (indexPath.row ==1) {
        cell.imageView.image = [UIImage imageNamed:@"MasonryPic2"];
    }
    //cell.title.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row ];
    return cell;
}


@end
