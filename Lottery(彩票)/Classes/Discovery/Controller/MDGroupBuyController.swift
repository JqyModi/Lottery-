//
//  MDGroupBuyController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDGroupBuyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }

    private func setupUI() {
        view.addSubview(blueView)
    }
    
    @IBAction func titleBtnDidClicked(_ sender: MDGroupBuyButton) {
        //设置导航栏不半透明:false会预留一个导航栏高度再显示
        self.navigationController?.navigationBar.isTranslucent = true  //default
        UIView.animate(withDuration: 0.25) {
            self.blueView.h = (self.blueView.h != 0) ? 0 : 150
        }
        
    }
    
    //懒加载一个view
    lazy var blueView: UIView = {
        let blue = UIView()
        blue.backgroundColor = UIColor.blue
        blue.w = screenWidth
        blue.h = 0
        blue.x = 0
        blue.y = 64
        return blue
    }()
}
