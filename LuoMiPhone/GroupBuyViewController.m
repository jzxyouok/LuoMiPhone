//
//  GroupBuyViewController.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupBuyViewController.h"
#import "GroupbyScrollTableViewCell.h"
#import "LMRefreshControl.h"

#define groupbyScrollTableViewCellIdentifier  @"GroupbyScrollTableViewCell"

@interface GroupBuyViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign) CGFloat scrollPicHeight;
//@property(nonatomic,strong) GroupbyScrollTableViewCell *groupbyScrollTableViewCell;
@property(nonatomic,strong) LMRefreshControl *refreshControl;
@end

@implementation GroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.refreshControl = [LMRefreshControl initRefreshControl:self targetAction:@selector(startLoading) scrollView:self.tableView];
//    self.tableView.delegate = self;
//    
//    self.tableView.dataSource = self;
    self.scrollPicHeight = 280;
    [self.tableView registerNib:[UINib nibWithNibName:groupbyScrollTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:groupbyScrollTableViewCellIdentifier];
    //self.groupbyScrollTableViewCell =  [(GroupbyScrollTableViewCell *)[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:groupbyScrollTableViewCellIdentifier];
    // Do any additional setup after loading the view from its nib.
}

-(void)startLoading{
    [self performSelector:@selector(endLoading) withObject:self afterDelay:3];
}

-(void)endLoading{
    [self.refreshControl endRefresh];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 1;
    }
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}// Default is 1 if not implemented


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static GroupbyScrollTableViewCell *groupbyScrollTableViewCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        groupbyScrollTableViewCell = (GroupbyScrollTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:groupbyScrollTableViewCellIdentifier];
    });
    [groupbyScrollTableViewCell setNeedsDisplay];
    [groupbyScrollTableViewCell layoutIfNeeded];
    
    CGSize groupbyScrollTableViewCellSize = [groupbyScrollTableViewCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    if (indexPath.row == 0) {
        //return groupbyScrollTableViewCellSize.height + 1;
       // return 280;
       return  self.scrollPicHeight ;
    }
     return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return 0;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 /*   if(indexPath.section == 0){
        static NSString *firstCellIdentifier = groupbyScrollTableViewCellIdentifier;
        GroupbyScrollTableViewCell *cell = (GroupbyScrollTableViewCell *)[tableView dequeueReusableCellWithIdentifier:firstCellIdentifier forIndexPath:indexPath];
        cell.picScrollView.viewTapped = ^(NSInteger index){
            NSLog(@"view tapped at index = %ld", (long)index);
        };
        cell.picScrollView.closeButtonClicked = ^void(){
            cell.scrollHeightConstraint.constant = 0;
            self.scrollPicHeight = 180;
            [self.tableView reloadData];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }*/
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
