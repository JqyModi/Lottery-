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
    @IBAction func settingDidClicked(_ sender: UIBarButtonItem) {
        let setting = MDSettingController()
        //设置标题
        setting.title = "设置"
        setting.plistName = "setting"
        
        //设置setting界面的右上角按钮
        let rightItem = UIBarButtonItem(title: "常见问题", style: .plain, target: self, action: #selector(self.rightItemDidClicked))
        setting.navigationItem.rightBarButtonItem = rightItem
        
        self.navigationController?.pushViewController(setting, animated: true)
    }
    
    @objc private func rightItemDidClicked() {
        //跳转到常见问题界面
        let help = MDHelpController()
        //设置标题
        help.title = "常见问题"
        self.navigationController?.pushViewController(help, animated: true)
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
