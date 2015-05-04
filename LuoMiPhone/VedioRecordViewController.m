//
//  VedioRecordViewController.m
//  LMPullToRefresh
//
//  Created by Tim Geng on 4/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "VedioRecordViewController.h"
#import "CameraImageHelper.h"
#import "RecordingCircleOverlayView.h"
#import "FowardViewController.h"
@interface VedioRecordViewController ()

@property(strong,nonatomic) CameraImageHelper *CameraHelper;
@property (weak, nonatomic) IBOutlet UIView *liveView;
@property(nonatomic,strong) UIVisualEffectView *visualEffectView;

@end

@implementation VedioRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _CameraHelper = [[CameraImageHelper alloc]init];
    [_CameraHelper startRunning];
    [_CameraHelper embedPreviewInView:self.liveView];
    
    RecordingCircleOverlayView *recordingCircleOverlayView = [[RecordingCircleOverlayView alloc] initWithFrame:self.recordView.bounds strokeWidth:7.f insets:UIEdgeInsetsMake(50.f, 50.f, 50.f, 50.f)];
    recordingCircleOverlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    recordingCircleOverlayView.duration = 10.f;
    [self.recordView addSubview:recordingCircleOverlayView];
    
}



-(void)getImage
{
    FowardViewController *foward = [[FowardViewController alloc] initWithNibName:@"FowardViewController" bundle:nil];
    self.navigationController.delegate = nil;
    foward.imageView.image = [_CameraHelper image];
    UIImage *image = [_CameraHelper image];
    foward.image = image;
    self.imageView.image = image;
    [self.navigationController pushViewController:foward animated:YES];
}

- (IBAction)snapPressed:(id)sender {
    [_CameraHelper CaptureStillImage];
    [self performSelector:@selector(getImage) withObject:nil afterDelay:0.5];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2.0 animations:^{
    
        self.visualEffectView.alpha = 0.3;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [left setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = left;
    
    self.tabBarController.tabBar.hidden = YES;

    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"转发到朋友圈" style:UIBarButtonItemStylePlain target:self action:@selector(foward)];
    [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = right;
    
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    self.visualEffectView.frame = self.liveView.bounds;
    self.visualEffectView.alpha = 1.0;
    [self.liveView addSubview:self.visualEffectView];

}

-(void)foward{
    
    
    [_CameraHelper CaptureStillImage];
    [self performSelector:@selector(getImage) withObject:nil afterDelay:0.5];
    
   
}

-(void)cancel{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];

//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
