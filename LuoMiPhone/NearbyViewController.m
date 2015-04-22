//
//  NearbyViewController.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "NearbyViewController.h"
#import "JSDropDownMenu.h"
#import "JSIndexPath.h"

@interface NearbyViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>{
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    NSMutableArray *_data4;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
    NSInteger _currentData4Index;
    
    NSInteger _currentData1SelectedIndex;
    JSDropDownMenu *menu;
    
}

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentData1Index = 1;
    _currentData1SelectedIndex = 1;
    
    NSArray *quanbufenlei = @[];
    NSArray *jinrixindan = @[];
    NSArray *dianying = @[];
    NSArray *meishi = @[@"全部", @"全部中餐", @"小吃快餐", @"火锅", @"自助餐"];
    NSArray *jiudian = @[@"全部",@"经济型酒店",@"快捷酒店",@"青年旅社",@"钟点房",@"商务酒店"];
    
    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"全部分类", @"data":quanbufenlei}, @{@"title":@"今日新单", @"data":jinrixindan},@{@"title":@"电影", @"data":dianying}, @{@"title":@"美食", @"data":meishi} , @{@"title":@"酒店", @"data":jiudian}, nil];
    _data2 = [NSMutableArray arrayWithObjects: @"全城", @"500m", @"1km", @"3km", @"5km",  nil];
    _data3 = [NSMutableArray arrayWithObjects:@"默认排序", @"离我最近", @"评价最高", @"最新发布", @"销量最高", @"价格最低", @"价格最高", nil];
    _data4 = [NSMutableArray arrayWithObjects:@"筛选",  nil];
    
    menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    // menu.textColor = [UIColor redColor];
    
    menu.dataSource = self;
    menu.delegate = self;
    menu.frame = self.menuView.frame;
    [self.menuView addSubview:menu];
    // Do any additional setup after loading the view from its nib.
}


- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 4;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    
    if([[_data1[column] objectForKey:@"data"] count] == 0){
        
        return NO;
    }
    
    return YES;
    
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    if (column==0) {
        return 0.5;
    }
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
        
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        if (leftOrRight==0) {
            
            return _data1.count;
        } else{
            
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] count];
        }
    } else if (column==1){
        
        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    } else if (column== 3){
        return _data4.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0:
            if ([[_data1[_currentData1Index] objectForKey:@"data"] count] == 0) {
                return  [_data1[_currentData1Index] objectForKey:@"title"];
            }
            return [[_data1[_currentData1Index] objectForKey:@"data"] objectAtIndex:_currentData1SelectedIndex];
            
            break;
        case 1: return _data2[_currentData2Index];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        case 3: return _data4[_currentData4Index];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            NSDictionary *menuDic = [_data1 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        } else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else if (indexPath.column==1) {
        
        return _data2[indexPath.row];
        
    } else {
        
        return _data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
        if(indexPath.leftOrRight==0){
            
            _currentData1Index = indexPath.row;
            
            return;
        }
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else if(indexPath.column == 2){
        
        _currentData3Index = indexPath.row;
    } else {
        _currentData4Index = indexPath.row;
    }
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
