//
//  MDNavigationController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置navigationBar背景及文字样式
        let image = UIImage(named: "NavBar64")
        //UIBarMetrics default表示横竖屏都显示
        self.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        
        //通过属性设置字体样式
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //push操作之前先隐藏掉系统TabBar：也可以在storyboard中勾选：效率不高
        viewController.hidesBottomBarWhenPushed = true
        //再调用系统push操作
        super.pushViewController(viewController, animated: animated)
    }

}
