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
#import "CityListViewController.h"
#import "MyViewController.h"
#import "MasonryTableViewCell.h"
#define MasonryTableViewCellIdentifier @"MasonryTableViewCell"

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
@property(nonatomic,strong) id <UIViewControllerContextTransitioning> transitionContext;
@property(nonatomic,strong) UIButton *button;
@end

@implementation GroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.transitioningDelegate = self;

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
    [self.tableView registerNib:[UINib nibWithNibName:MasonryTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:MasonryTableViewCellIdentifier];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"mc0"],@"image",@"1毛钱吃麦当劳",@"listTitle",@"1毛钱吃麦当劳原味板烧鸡腿堡",@"listDetail",@"￥0.1",@"listPrice",@"已售344245",@"listSales", nil];
    self.groupListModal = [[GroupByListModal alloc] initWith:dic];
    self.tableRows = 20;
    self.tableView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button addTarget:self action:@selector(showCitySelected) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"上海" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.button.frame = CGRectMake(0, 0, 30, 30);
    self.button.backgroundColor = [UIColor blackColor];
    self.button.layer.cornerRadius = self.button.frame.size.width/2;
    self.button.layer.masksToBounds = YES;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.button] ;
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // self.view.backgroundColor = [UIColor redColor];
//    NSLog(@"***********%f",self.topTableViewConstraint.constant);
//    NSLog(@"***********%@",NSStringFromCGRect(self.tableView.frame));
//    NSLog(@"***********%@",NSStringFromCGRect(self.view.frame));
    self.view.frame = [[UIScreen mainScreen] bounds];

}

-(void)showCitySelected{
    self.navigationController.delegate = self;
    CityListViewController *cityList = [[CityListViewController alloc] init];
    cityList.transitioningDelegate = self;
  //  cityList.view.frame = [UIScreen mainScreen].bounds;
    MyViewController *my = [[ MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
    my.view.backgroundColor = [UIColor redColor];
    my.transitioningDelegate = self;
    my.tabBarController.tabBar.hidden  = YES;
    [self.navigationController pushViewController:cityList animated:YES];
//    [self.navigationController pushViewController:cityList animated:YES];
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
//    static GroupbyScrollTableViewCell *groupbyScrollTableViewCell;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        groupbyScrollTableViewCell = (GroupbyScrollTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:groupbyScrollTableViewCellIdentifier];
//    });
//    [groupbyScrollTableViewCell setNeedsDisplay];
//    [groupbyScrollTableViewCell layoutIfNeeded];
//    
//    CGSize groupbyScrollTableViewCellSize = [groupbyScrollTableViewCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return [self heightForIndex:indexPath];
}

-(CGFloat)heightForIndex:(NSIndexPath *)indexPath{
    if (indexPath.row == self.tableRows - 2) {
        return 70;
    }
    if (indexPath.row == 6) {
        return 40;
    }
    if (indexPath.row == self.tableRows - 1) {
        return 415;
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

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self heightForIndex:indexPath];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==  self.tableRows - 1) {
        static NSString *mansoryTableViewCellIdentifier = MasonryTableViewCellIdentifier;
        MasonryTableViewCell *cell = (MasonryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:mansoryTableViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.row == 6){
        static NSString *ListHeaderTableViewCell = groupListHeaderTableViewCellIdentifer;
        GroupListHeaderTableViewCell *cell = (GroupListHeaderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ListHeaderTableViewCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.row == self.tableRows - 2){
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

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    UIView *containerView = self.transitionContext.containerView;
    GroupBuyViewController *fromController = (GroupBuyViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
//    UIButton *button = fromController.button;
    CGRect buttonFrame = self.button.frame;

    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toViewController.view];
    

    UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:buttonFrame];
    CGPoint extremePoint = CGPointMake(15, 15 - CGRectGetHeight(toViewController.view.bounds));
    CGFloat radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(buttonFrame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = circleMaskPathFinal.CGPath;
    toViewController.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
    maskLayerAnimation.toValue = (__bridge id)(circleMaskPathFinal.CGPath);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];


}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
   // BOOL yes = [self.transitionContext transitionWasCancelled];
    [self.transitionContext completeTransition:YES];
    UIViewController *toViewController = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
  // [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    toViewController.view.layer.mask = nil;
}

//- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0){
//    return self;
//}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return self;
}

@end
