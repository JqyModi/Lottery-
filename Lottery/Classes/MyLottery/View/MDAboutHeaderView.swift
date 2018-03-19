//
//  MDAboutHeaderView.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDAboutHeaderView: UIView {

    //提供一个类方法类创建xib类型View
    class func headerViewFormXib() -> MDAboutHeaderView {
        let nib = Bundle.main.loadNibNamed("AboutHeaderView", owner: nil, options: nil)![0]
        return nib as! MDAboutHeaderView
    }
}
