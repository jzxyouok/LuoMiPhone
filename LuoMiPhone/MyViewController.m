//
//  MyViewController.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "MyViewController.h"
#import "MasonryTableViewCell.h"
#import "LMEyeVedioControl.h"
#import "VedioRecordViewController.h"


#define MasonryTableViewCellIdentifier @"MasonryTableViewCell"

@interface MyViewController ()
@property(nonatomic,strong) LMEyeVedioControl *refreshControl;
@property(nonatomic,strong) id <UIViewControllerContextTransitioning> transitionContext;
@end

@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    if ([[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[MyViewController class]]) {
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        MyViewController *srcVC = (MyViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        // 2. Set init frame for toVC
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
        
        // 3. Add toVC's view to containerView
        UIView *containerView = [transitionContext containerView];
        
        
        [containerView addSubview:toVC.view];
        // 4. Do animate now
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        
       // [srcVC.tableView setContentOffset:CGPointMake(0, se) animated:YES];

//        [UIView animateWithDuration:duration
//                              delay:0.0
//             usingSpringWithDamping:0.6
//              initialSpringVelocity:0.0
//                            options:UIViewAnimationOptionCurveLinear
//                         animations:^{
//                             
//                             [srcVC.tableView setContentOffset:CGPointMake(0, -[[UIScreen mainScreen] bounds].size.height) animated:NO];
//
//                             
//                         } completion:^(BOOL finished) {
//                             // 5. Tell context that we completed.
//                             toVC.view.frame = finalFrame;
//                             
//                             [transitionContext completeTransition:YES];
//                         }];
       
    // [srcVC.tableView setContentOffset:CGPointMake(0, -200) animated:NO];
        [UIView animateWithDuration:duration animations:^{
       //  [srcVC.tableView setContentOffset:CGPointMake(0, -[[UIScreen mainScreen] bounds].size.height) animated:YES];
        } completion:^(BOOL finished){
            toVC.view.frame = finalFrame;
            
            [transitionContext completeTransition:YES];
        }];
        //        double delayInSeconds = 2.0;
        //        //创建一个调度时间,相对于默认时钟或修改现有的调度时间。
        //        dispatch_time_t delayInNanoSeconds =dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        //        //推迟两纳秒执行
        //        dispatch_queue_t concurrentQueue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //        dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){
        //            NSLog(@"Grand Center Dispatch!");
        //        });
        
        
        
        
        
    }else{
        MyViewController *toVC = (MyViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController *srcVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        // 2. Set init frame for toVC
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
        
        // 3. Add toVC's view to containerView
        UIView *containerView = [transitionContext containerView];
        [containerView addSubview:toVC.view];
        
        // 4. Do animate now
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        //[toVC.tableView setContentOffset:CGPointMake(0, -[[UIScreen mainScreen] bounds].size.height) animated:NO];
        
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:0.6
              initialSpringVelocity:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                            // [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
                             [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
                             
                         } completion:^(BOOL finished) {
                             // 5. Tell context that we completed.
                             toVC.view.frame = finalFrame;
                             // [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
                             [transitionContext completeTransition:YES];
                         }];
    }
    
    
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.1;
//    if ([[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[MyViewController class]]) {
//        
//    }else{
//        
//    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return self;
}

-(void)startLoading{
    [self performSelector:@selector(endLoading) withObject:self afterDelay:3];
}

-(void)endLoading{
    [self.refreshControl endRefresh];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"frame = %@ %@",NSStringFromCGRect(self.tableView.frame),NSStringFromCGPoint(self.tableView.contentOffset));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:MasonryTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:MasonryTableViewCellIdentifier];
    self.title = @"石工布局";
    
    self.refreshControl = [LMEyeVedioControl initRefreshControl:self targetAction:@selector(startLoading) scrollView:self.tableView];
    
    
    
    
    VedioRecordViewController *vedioController = [[VedioRecordViewController alloc] initWithNibName:@"VedioRecordViewController" bundle:nil];
    __weak typeof(self) weakSelf = self;
    vedioController.transitioningDelegate = self;
    self.transitioningDelegate = self;
    self.navigationController.delegate = self;
    self.refreshControl.beginShowVideo = ^void(){
        weakSelf.navigationController.delegate = weakSelf;
        
        [weakSelf.navigationController pushViewController:vedioController animated:YES];
        //   [weakSelf presentViewController:vedioController animated:YES completion:nil];
    };

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;

  //  self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
return 415;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        static NSString *mansoryTableViewCellIdentifier = MasonryTableViewCellIdentifier;
        MasonryTableViewCell *cell = (MasonryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:mansoryTableViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.refreshControl scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.refreshControl scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
