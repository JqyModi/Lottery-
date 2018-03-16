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
        
    }

}
