//
//  MDTabBarViewController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

private struct Const {
    static let HALL = "Hall"
    static let Arena = "Arena"
    static let History = "History"
    static let Discovery = "Discovery"
    static let MyLottery = "MyLottery"
    
    static let VCCOUNT = 5
}

class MDTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let v1 = getViewControllerWithName(name: Const.HALL)
        let v2 = getViewControllerWithName(name: Const.Arena)
        let v4 = getViewControllerWithName(name: Const.History)
        let v3 = getViewControllerWithName(name: Const.Discovery)
        let v5 = getViewControllerWithName(name: Const.MyLottery)
        
        self.addChildViewController(v1)
        self.addChildViewController(v2)
        self.addChildViewController(v3)
        self.addChildViewController(v4)
        self.addChildViewController(v5)
        
        //设置当前的TabBar
        setupTabBar()
        
    }
    
    private func setupTabBar() {
        //定义一个与系统TabBar的frame一样大小的
//        let tabbar = MDTabBar(frame: self.tabBar.frame)
        //2.修改frame为bounds
        let tabbar = MDTabBar(frame: self.tabBar.bounds)
        //获取图片
        for i in (0..<Const.VCCOUNT) {
            let norName = "TabBar\(i+1)"
            let selName = "TabBar\(i+1)Sel"
            //添加5个TabBar
            tabbar.addButtonWithImage(image: norName, selImage: selName)
        }
        //将MDTabBar添加到View上
//        self.view.addSubview(tabbar)
        //1.添加到系统的tabbar上方便用系统的移除操作
        self.tabBar.addSubview(tabbar)
        //实现block
        tabbar.selectItemBlock = { (index) in
            //通过系统的TabBar的selectedIndex来切换控制器
            self.selectedIndex = index
        }
    }
    
    private func getViewControllerWithName(name: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: Bundle.main)
        return sb.instantiateInitialViewController()!
    }
}
