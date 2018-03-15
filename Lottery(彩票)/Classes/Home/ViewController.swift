//
//  ViewController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/14.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupBgWithPull()
//        setupBgWithTile()
        
        //代码添加幸运转盘View
        setupView()
        
    }
    
    private func setupView() {
        let lucky = LuckyView.luckyView()
        self.view.addSubview(lucky)
        //设置居中显示
        lucky.center = self.view.center
        
        //设置转盘旋转
        lucky.startRotate()
    }

    /**
     *  Desc:以拉升方式绘制图片到View上
     *  Param:
     */
    private func setupBgWithPull() {
        let image = UIImage(named: "LuckyBackground")
        //图片不够大不能通过平铺方式添加到背景上而是通过拉升绘制到背景
        self.view.layer.contents = image?.cgImage //内部自动调用系统绘制
    }
    
    /**
     *  Desc:以平铺方式绘制图片到View上
     *  Param:
     */
    private func setupBgWithTile() {
        let image = UIImage(named: "LuckyBackground")
        //图片不够大不能通过平铺方式添加到背景上而是通过拉升绘制到背景
        self.view.backgroundColor = UIColor.init(patternImage: image!)
    }
    
}

