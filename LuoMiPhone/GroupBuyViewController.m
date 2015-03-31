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
#import "GroupBuyViewController.h"
#import "SelectedBrandMenuViewCell.h"
#import "CommentGiftTableViewCell.h"
#import "GroupByListTableViewCell.h"
#import "GroupByListModal.h"
#import "CheckAllGroupByButtonTableViewCell.h"
#import "GroupListHeaderTableViewCell.h"

#define groupbyScrollTableViewCellIdentifier  @"GroupbyScrollTableViewCell"
#define selectedBrandTableViewCellIdentifier @"SelectedBrandMenuViewCell"
#define commentGiftTableViewCellIdentifer  @"CommentGiftTableViewCell"
#define groupByListTableViewCellIdentifier @"GroupByListTableViewCell"
#define checkAllGroupByButtonTableViewCellIdentifer @"CheckAllGroupByButtonTableViewCell"
#define groupListHeaderTableViewCellIdentifer @"GroupListHeaderTableViewCell"

@interface GroupBuyViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign) CGFloat scrollPicHeight;
//@property(nonatomic,strong) GroupbyScrollTableViewCell *groupbyScrollTableViewCell;
@property(nonatomic,strong) LMRefreshControl *refreshControl;
@property(nonatomic,strong) GroupByListModal *groupListModal;
@property(nonatomic,assign) NSInteger tableRows;
@end

@implementation GroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    self.refreshControl = [LMRefreshControl initRefreshControl:self targetAction:@selector(startLoading) scrollView:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.scrollPicHeight = 280;
    [self.tableView registerNib:[UINib nibWithNibName:groupbyScrollTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:groupbyScrollTableViewCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:selectedBrandTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:selectedBrandTableViewCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:commentGiftTableViewCellIdentifer bundle:nil] forCellReuseIdentifier:commentGiftTableViewCellIdentifer];
    [self.tableView registerNib:[UINib nibWithNibName:groupByListTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:groupByListTableViewCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:checkAllGroupByButtonTableViewCellIdentifer bundle:nil] forCellReuseIdentifier:checkAllGroupByButtonTableViewCellIdentifer];
    [self.tableView registerNib:[UINib nibWithNibName:groupListHeaderTableViewCellIdentifer bundle:nil] forCellReuseIdentifier:groupListHeaderTableViewCellIdentifer];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"mc"],@"image",@"1毛钱吃麦当劳",@"listTitle",@"1毛钱吃麦当劳原味板烧鸡腿堡",@"listDetail",@"￥0.1",@"listPrice",@"已售344245",@"listSales", nil];
    self.groupListModal = [[GroupByListModal alloc] initWith:dic];
    self.tableRows = 20;
    self.tableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
}

-(void)startLoading{
    [self performSelector:@selector(endLoading) withObject:self afterDelay:3];
}

-(void)endLoading{
    [self.refreshControl endRefresh];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.refreshControl scrollViewWillBeginDragging:scrollView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.refreshControl scrollViewDidEndDragging:scrollView willDecelerate:decelerate];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableRows;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static GroupbyScrollTableViewCell *groupbyScrollTableViewCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        groupbyScrollTableViewCell = (GroupbyScrollTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:groupbyScrollTableViewCellIdentifier];
    });
    [groupbyScrollTableViewCell setNeedsDisplay];
    [groupbyScrollTableViewCell layoutIfNeeded];
    
    CGSize groupbyScrollTableViewCellSize = [groupbyScrollTableViewCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    if (indexPath.row == self.tableRows - 1) {
        return 70;
    }
    if (indexPath.row == 6) {
        return 40;
    }
    if (indexPath.row == 0) {
        //return groupbyScrollTableViewCellSize.height + 1;
       // return 280;
       return  self.scrollPicHeight ;
    } else if (indexPath.row == 2){
        return 164;
    } else if (indexPath.row == 4){
        return 70;
    }else if (indexPath.row > 6){
        return 100;
    }
    if (indexPath.row % 2 == 1) {
        return 10;
    }
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 6){
        static NSString *ListHeaderTableViewCell = groupListHeaderTableViewCellIdentifer;
        GroupListHeaderTableViewCell *cell = (GroupListHeaderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ListHeaderTableViewCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row == self.tableRows - 1){
        static NSString *checkAllGroupByButtonTableViewCell = checkAllGroupByButtonTableViewCellIdentifer;
        CheckAllGroupByButtonTableViewCell *cell = (CheckAllGroupByButtonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:checkAllGroupByButtonTableViewCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row > 6){
        static NSString *GroupByListTableViewCellIdentifier = groupByListTableViewCellIdentifier;
        GroupByListTableViewCell *cell = (GroupByListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:GroupByListTableViewCellIdentifier forIndexPath:indexPath];
        [cell setGroupByListModal:self.groupListModal];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row % 2 == 1) {
        static NSString *separatorIdentifier = @"separatorIdentifier";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:separatorIdentifier];
        cell.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        return cell;
    }
    if(indexPath.row == 0){
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
    }
    if (indexPath.row == 2) {
        static NSString *SelectedBrandMenuViewCellIdentifier = selectedBrandTableViewCellIdentifier;
        SelectedBrandMenuViewCell *cell = (SelectedBrandMenuViewCell *)[tableView dequeueReusableCellWithIdentifier:SelectedBrandMenuViewCellIdentifier forIndexPath:indexPath];
       
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.row == 4) {
        static NSString *commentGiftTableViewCellIdentiferIdentifer = commentGiftTableViewCellIdentifer;
        CommentGiftTableViewCell *cell = (CommentGiftTableViewCell *)[tableView dequeueReusableCellWithIdentifier:commentGiftTableViewCellIdentiferIdentifer forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
