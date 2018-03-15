//
//  LuckyView.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/15.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class LuckyView: UIView {

    class func luckyView() -> LuckyView {
        let lucky = Bundle.main.loadNibNamed("LuckyView", owner: nil, options: nil)?.first
        return lucky as! LuckyView
    }
    
    
    
}
