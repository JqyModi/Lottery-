//
//  MDLuckyController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDLuckyController: UIViewController {

    @IBOutlet weak var lightImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        anima()
    }

    /**
     *  Desc:序列帧动画
     *  Param:
     */
    private func anima() {
        //
        let img = UIImage(named: "lucky_entry_light0")
        let img1 = UIImage(named: "lucky_entry_light1")
        lightImageView.animationImages = [img!,img1!]
        lightImageView.animationDuration = 1
        lightImageView.animationRepeatCount = 0
        lightImageView.startAnimating()
    }
}
