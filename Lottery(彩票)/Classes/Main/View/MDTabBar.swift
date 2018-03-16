//
//  MDTabBar.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDTabBar: UIView {
    //记录当前TabBar子控件个数
    static let count = 5
    
    //记录当前选择的btn
    var currentBtn: MDTabBarButton?
    
    //定义一个block来响应选中跳转控制器
    var selectItemBlock: ((_ index: Int) -> ())?
    
    func addButtonWithImage(image: String, selImage: String) {
        //创建按钮并添加到布局
        let btn = MDTabBarButton()
        //设置图片
        let image = UIImage(named: image)
        let selImage = UIImage(named: selImage)
        btn.setBackgroundImage(image, for: .normal)
        btn.setBackgroundImage(selImage, for: .selected)
        
        //监听按钮点击事件
        btn.addTarget(self, action: #selector(self.btnDidTouchDown(btn:)), for: .touchDown)
        
        addSubview(btn)
    }
    
    @objc private func btnDidTouchDown(btn: MDTabBarButton) {
        //将上一个btn设置取消选中状态
        currentBtn?.isSelected = false
        btn.isSelected = true
        self.currentBtn = btn
        
        //判断当前block是否有值
        if (selectItemBlock != nil) {
            selectItemBlock!(btn.tag)
        }
    }

    //布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for i in (0..<subviews.count) {
            let btn = subviews[i]
            //设置tag方便布局
            btn.tag = i
            let width = bounds.width / CGFloat(MDTabBar.count)
            let height = bounds.height
            let x = CGFloat(i) * width
            let y = bounds.minY
            btn.frame = CGRect(x: x, y: y, width: width, height: height)
        }

    }
    
}
