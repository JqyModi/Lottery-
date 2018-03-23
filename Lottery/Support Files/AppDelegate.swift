//
//  AppDelegate.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/14.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //定义window
        self.window = UIWindow()
        
        //定义TabBarController
        let tabBarController = selectCurrentController()
        
        //设置根布局
        self.window?.rootViewController = tabBarController
        
        //设置为主窗口并显示
        self.window?.makeKeyAndVisible()
        
        //保存当前最新版本号到沙盒
        self.saveAppVersion()
        
        return true
    }

    //选择要加载的控制器：主页/新特性页
    private func selectCurrentController() -> UIViewController {
        if (loadCurrentAppVersion() == loadAppVersion()) {
            debugPrint("MDTabBarViewController")
            return MDTabBarViewController()
        }else {
            debugPrint("newsController")
//            let v = UIViewController()
//            v.view.backgroundColor = UIColor.orange
            return MDGuideController()
        }
    }
    
    //读取当前App版本号
    private func loadCurrentAppVersion() -> String {
        //获取当前版本号
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        debugPrint("appVersion1 ---> \(appVersion)")
        return appVersion
    }
    
    //读取沙盒保存的数据
    private func loadAppVersion() -> String {
        let ud = UserDefaults.standard
        if let appVersion = ud.value(forKey: "appVersion") as? String {
            debugPrint("appVersion2 ---> \(appVersion)")
            return appVersion
        }
        return  ""
    }
    
    //将当前版本号保存到沙盒
    private func saveAppVersion() {
        let appVersion = loadCurrentAppVersion()
//        debugPrint("appVersion ---> \(appVersion)")
        //保存
        let ud = UserDefaults.standard
        ud.set(appVersion, forKey: "appVersion")
        //立即保存：同步
        ud.synchronize()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        //处理通过URL方式打开本应用的操作
        debugPrint("url ----> \(url)")
        return true
    }
    
}

