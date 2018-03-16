//
//  MDHallViewController.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDHallViewController: UITableViewController {

    //引用需要移除的View
    var maskView: UIView?
    var ivView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavStyle()
    }

    private func setupNavStyle() {
        
        var image = UIImage(named: "CS50_activity_image")
        //改变图片的渲染方式：系统默认渲染成主题色
        image = image?.withRenderingMode(.alwaysOriginal)
        let leftBtn = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: #selector(self.activityDidClicked))
        //设置当前导航控制器的样式
        self.navigationItem.leftBarButtonItem = leftBtn
        
    }
    
    @objc private func activityDidClicked() {
        debugPrint("活动")
        
        //弹出活动页面：新建一个全屏View并设置透明背景：遮罩效果
        let bgView = UIView(frame: screenBounds)
        self.maskView = bgView
        //设置背景颜色
        bgView.backgroundColor = UIColor.black
        //设置半透明
        bgView.alpha = 0.5
        //添加到最外层View上：遮罩整个窗口:UIWindow -> TabBarController -> NavigationController -> MDHallViewController
        self.tabBarController?.view.addSubview(bgView)
        
        //添加图片
        let iv = UIImageView()
        self.ivView = iv
        //开启用户交互
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "showActivity")
        iv.sizeToFit()
        iv.center = self.view.center
        //添加到最外层View上：不要添加到半透明的背景上 图片也会变半透明
        self.tabBarController?.view.addSubview(iv)
        
        //添加关闭按钮
        let closeBtn = UIButton()

        let image = UIImage(named: "alphaClose")
        closeBtn.setBackgroundImage(image, for: .normal)
        //布局位置
        closeBtn.frame = CGRect(x: iv.bounds.size.width - (image?.size.width)!, y: 0, width: 0, height: 0)
        closeBtn.sizeToFit()
        //监听点击事件
        closeBtn.addTarget(self, action: #selector(self.closeBtnDidClicked), for: .touchUpInside)
        //添加到view上
        iv.addSubview(closeBtn)
    }
    
    @objc private func closeBtnDidClicked() {
        //点击不了：ImageView默认不支持用户交互 阻挡了点击事件的传递
        
        //移除遮罩布局 + 图片View
        UIView.animate(withDuration: 0.25) {
            self.maskView?.alpha = 0
            //移除View
            self.maskView?.removeFromSuperview()
            
            self.ivView?.alpha = 0
            self.ivView?.removeFromSuperview()
        }
    }
}
