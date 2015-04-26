//
//  MyViewController.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "MyViewController.h"

#import "MasonryTableViewCell.h"
#define MasonryTableViewCellIdentifier @"MasonryTableViewCell"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:MasonryTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:MasonryTableViewCellIdentifier];
    self.title = @"石工布局";
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
