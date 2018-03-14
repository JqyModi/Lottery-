//
//  AppDelegate.m
//  xx-residemenu
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu/RESideMenu.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1.创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.创建内容控制器
    UIViewController * contentVC =[[UIViewController alloc] init];
    contentVC.view.backgroundColor  =[UIColor redColor];
    
    // 2.1设置左边item
    UIBarButtonItem * leftItem =[[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:contentVC action:@selector(presentLeftMenuViewController:)];
    
    contentVC.navigationItem.leftBarButtonItem = leftItem;
    
    // 3.用一个nav包装这个内容的控制器
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:contentVC];
    
    // 4.创建左控制器
    UIViewController * leftVC =[[UIViewController alloc] init];
    leftVC.view.backgroundColor = [UIColor blueColor];
    
    // 5.创建右控制器
    UIViewController * rightVC =[[UIViewController alloc] init];
    rightVC.view.backgroundColor = [UIColor yellowColor];
    
    // 6.创建 RESideMenu对象 把三个控制器传进去
    RESideMenu * menu =[[RESideMenu alloc] initWithContentViewController:nav leftMenuViewController:leftVC rightMenuViewController:rightVC];
    
    // 7.设置window根控制器
    self.window.rootViewController = menu;
    
    // 8.显示window
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
