//
//  MDActivityView.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDActivityView: UIView {
    //引用需要移除的View
    var mdMaskView: UIView?
    var ivView: UIImageView?
    var closeBtn: UIButton?
    var anchor: UIView?
    
    func addMaskViewWithAnchorView(anchor: UIView, imageName: String, closeImageName: String) {
        self.anchor = anchor
        
        //弹出活动页面：新建一个全屏View并设置透明背景：遮罩效果
        let bgView = UIView(frame: screenBounds)
        self.mdMaskView = bgView
        //设置背景颜色
        bgView.backgroundColor = UIColor.black
        //设置半透明
        bgView.alpha = 0.5
        //添加到最外层View上：遮罩整个窗口:UIWindow -> TabBarController -> NavigationController -> MDHallViewController
        self.addSubview(bgView)
        
        //添加图片
        let iv = UIImageView()
        self.ivView = iv
        //开启用户交互
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: imageName)
        iv.sizeToFit()
        iv.center = anchor.center
        //添加到最外层View上：不要添加到半透明的背景上 图片也会变半透明
        self.addSubview(iv)
        
        //添加关闭按钮
        let closeBtn = UIButton()
        self.closeBtn = closeBtn
        let image = UIImage(named: closeImageName)
        closeBtn.setBackgroundImage(image, for: .normal)
        //监听点击事件
        closeBtn.addTarget(self, action: #selector(self.closeBtnDidClicked), for: .touchUpInside)
        //布局位置
        closeBtn.frame = CGRect(x: iv.bounds.size.width - (image?.size.width)!, y: 0, width: 0, height: 0)
        closeBtn.sizeToFit()
        //添加到view上
        iv.addSubview(closeBtn)
        
        debugPrint("anchor -------> \(anchor.subviews)")
        
        anchor.addSubview(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //布局子控件
    }
    
    @objc private func closeBtnDidClicked() {
        //点击不了：ImageView默认不支持用户交互 阻挡了点击事件的传递
        debugPrint("func --> \(#function) : line --> \(#line)")
        //移除遮罩布局 + 图片View
        UIView.animate(withDuration: 0.25) {
            self.mdMaskView?.alpha = 0
            //移除View
            self.mdMaskView?.removeFromSuperview()
            
            self.ivView?.alpha = 0
            self.ivView?.removeFromSuperview()
        }
    }
    
}
