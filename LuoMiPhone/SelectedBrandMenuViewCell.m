//
//  SelectedBrandMenuView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "SelectedBrandMenuViewCell.h"
#import "LMTimerLabel.h"
#import "SelectedBrandCollectionViewCell.h"

@interface SelectedBrandMenuViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong) LMTimerLabel *lmTimerLabel;
@end

@implementation SelectedBrandMenuViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lmTimerLabel = [[LMTimerLabel alloc] initWithLabel:self.timeLabel];
    [self.lmTimerLabel setTimerToStopInterval:60*60*10]; //** Or you can use [timer3 setCountDownToDate:aDate];
    [self.lmTimerLabel start];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SelectedBrandCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SelectedBrandCollectionViewCell"];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(110, 123);
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectedBrandCollectionViewCell *cell = (SelectedBrandCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SelectedBrandCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
