//
//  MDArenaViewController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDArenaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavStyle()
    }
    
    private func setupNavStyle() {
        //设置当前导航控制器的样式
        let image = UIImage(named: "NLArenaNavBar64")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        //通过属性设置字体样式
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        //获取titleView上的segment改变样式
        let segment: UISegmentedControl = self.navigationItem.titleView as! UISegmentedControl
        segment.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
        segment.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .selected)
        segment.setBackgroundImage(UIImage(named: "CPArenaSegmentBG"), for: .normal, barMetrics: .default)
        segment.setBackgroundImage(UIImage(named: "CPArenaSegmentSelectedBG"), for: .selected, barMetrics: .default)
        
        //设置中间分割线透明
        segment.tintColor = UIColor.clear
    }

}
