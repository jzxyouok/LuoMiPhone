//
//  AppDelegate.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "AppDelegate.h"
#import "GroupBuyViewController.h"
#import "NearbyViewController.h"
#import "MyViewController.h"
#import "MoreViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabBarViewController = [[UITabBarController alloc] init];
    GroupBuyViewController *groupBuyViewController = [[GroupBuyViewController alloc] initWithNibName:@"GroupBuyViewController" bundle:nil];
    UINavigationController *naviGroupBuy = [[UINavigationController alloc] initWithRootViewController:groupBuyViewController];
    
    
    NearbyViewController *nearbyViewController = [[NearbyViewController alloc] initWithNibName:@"NearbyViewController" bundle:nil];
    UINavigationController *naviNearby = [[UINavigationController alloc] initWithRootViewController:nearbyViewController];
    
    
    MyViewController *myViewController = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
    UINavigationController *naviMy = [[UINavigationController alloc] initWithRootViewController:myViewController];
    
    
    MoreViewController *moreViewController = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
    UINavigationController *naviMore = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    
    
    UITabBarItem *item1 = [[UITabBarItem alloc ]initWithTitle:@"团购" image:[UIImage imageNamed:@"团购"] tag:0];
    UITabBarItem *item2 = [[UITabBarItem alloc ]initWithTitle:@"附近" image:[UIImage imageNamed:@"附近"] tag:0];
    UITabBarItem *item3 = [[UITabBarItem alloc ]initWithTitle:@"我的" image:[UIImage imageNamed:@"我的"] tag:0];
    UITabBarItem *item4 = [[UITabBarItem alloc ]initWithTitle:@"更多" image:[UIImage imageNamed:@"更多"] tag:0];
    
    naviGroupBuy.tabBarItem = item1;
    naviNearby.tabBarItem = item2;
    naviMy.tabBarItem = item3;
    naviMore.tabBarItem = item4;
    
    self.tabBarViewController.viewControllers = [NSArray arrayWithObjects:naviGroupBuy,naviNearby,naviMy,naviMore, nil];
    
    
    
    
    self.window.rootViewController = self.tabBarViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
