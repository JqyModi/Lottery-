//
//  MDMyLotteryController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDMyLotteryController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //切割图片解决图片模糊背景
        setLoginBtnBg()
    }

    private func setLoginBtnBg() {
        //获取背景图片
        var bgImage = loginBtn.backgroundImage(for: .normal)
        var bgSelImage = loginBtn.backgroundImage(for: .normal)
        //拉升切割背景图片并设置：通过切割四个角中间拉升来解决图片拉升变形
        bgImage = bgImage?.stretchableImage(withLeftCapWidth: Int((bgImage?.size.width)! * 0.5), topCapHeight: Int((bgImage?.size.height)! * 0.5))
        
//        bgImage = bgImage?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 15, left: 50, bottom: 15, right: 50), resizingMode: .stretch)
        
        bgSelImage = bgSelImage?.stretchableImage(withLeftCapWidth: Int((bgSelImage?.size.width)! * 0.5), topCapHeight: Int((bgSelImage?.size.height)! * 0.5))
        loginBtn.setBackgroundImage(bgImage, for: .normal)
        
    }
}
