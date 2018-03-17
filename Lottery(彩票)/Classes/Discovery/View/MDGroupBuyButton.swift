//
//  MDGroupBuyButton.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDGroupBuyButton: UIButton {

    //更改按钮中图标和文字的位置：布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.x = 0
        self.imageView?.x = (self.titleLabel?.w)!
    }
    
}
