//
//  AppDelegate.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "AppDelegate.h"
#import "HMTabBarController.h"
#import "HMGuideController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    // Override point for customization after application launch.

    // 创建 window
    self.window = [[UIWindow alloc] initWithFrame:kScreenSize];

    // window 设置根控制器
    self.window.rootViewController = [self pickViewContoller];

    // window 显示
    [self.window makeKeyAndVisible];

    // 把当前版本保存到沙盒当中
    [self saveAppVersion];

    return YES;
}

- (UIViewController*)pickViewContoller
{
    // 判断 沙盒版本号 是不是 和当前程序版本号(info) 一致
    if ([[self loadSavedAppVersion] isEqualToString:[self loadAppVersion]]) {
        // 如果一致 显示 tabbarController
        return [[HMTabBarController alloc] init];
    }

    else {
        // 如果不一致 显示 新特性
        return [[HMGuideController alloc] init];
    }
}

// 获取当前 info 的版本号
- (NSString*)loadAppVersion
{
    // 获取 info 字典
    NSDictionary* info = [NSBundle mainBundle].infoDictionary;

    // 获取当前程序的版本号
    NSString* appVersion = info[@"CFBundleShortVersionString"];
    return appVersion;
}

// 获取沙盒中的版本号
- (NSString*)loadSavedAppVersion
{
    // 获取 ud 单例
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"appVersion"];
}

// 把当前的版本号保存到沙盒
- (void)saveAppVersion
{
    // 获取 info 字典
    NSDictionary* info = [NSBundle mainBundle].infoDictionary;

    // 获取当前程序的版本号
    NSString* appVersion = info[@"CFBundleShortVersionString"];

    // 获取 ud 单例
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    // 保存到沙河当中
    [ud setObject:appVersion forKey:@"appVersion"];
}

- (void)applicationWillResignActive:(UIApplication*)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
