//
//  FowardViewController.m
//  LuoMiPhone
//
//  Created by Tim Geng on 5/2/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "FowardViewController.h"

@interface FowardViewController ()

@end

@implementation FowardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.title = @"朋友圈";
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(foward)];
    [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:145/255.0 green:219/255.0 blue:96/255.0 alpha:1.0],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = right;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:145/255.0 green:219/255.0 blue:96/255.0 alpha:1.0];
    // Do any additional setup after loading the view from its nib.
}

-(void)foward{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.imageView.image = self.image;
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
