//
//  LuckyView.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/15.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class LuckyView: UIView {
    
    //旋转的锯齿ImageView
    @IBOutlet weak var rotateImageView: UIImageView!
    
    @IBOutlet weak var startLucky: UIButton!
    //记录当前选中的按钮
    var selectedBtn: UIButton?
    
    lazy var rotateAnim: CABasicAnimation = {
        let r = CABasicAnimation()
        r.keyPath = "transform.rotation"
        let angle = 2 * Double.pi / 60 / 10
        r.byValue = angle
        //不回到原来位置
        r.fillMode = kCAFillModeForwards
        r.isRemovedOnCompletion = false
        return r
    }()
    
    lazy var ratoteTransform: CGAffineTransform = {
        let r = CGAffineTransform()
        return r
    }()
    
    
    class func luckyView() -> LuckyView {
        let lucky = Bundle.main.loadNibNamed("LuckyView", owner: nil, options: nil)?.first
        return lucky as! LuckyView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //初始化View
        createBtnAndAddView()
    }
    
    //创建12个按钮
    private func createBtnAndAddView() {
        for i in (0..<12) {
            let btn = UIButton()
//            btn.backgroundColor = UIColor.red
            //设置按钮图片
            let normal = clipImageWithBigImage(image: UIImage(named: "LuckyAstrology")!, index: i)
            btn.setImage(normal, for: .normal)
            //设置btn内边距上移图片内容
            btn.imageEdgeInsets = UIEdgeInsets(top: -50, left: 0, bottom: 0, right: 0)
            //设置选中图片
            let selected = clipImageWithBigImage(image: UIImage(named: "LuckyAstrologyPressed")!, index: i)
            btn.setImage(selected, for: .selected)
            //设置btn内边距上移图片内容
            btn.imageEdgeInsets = UIEdgeInsets(top: -50, left: 0, bottom: 0, right: 0)
            //设置背景图片
            btn.setBackgroundImage(UIImage(named: "LuckyRototeSelected"), for: .selected)
            //添加到View
            self.rotateImageView.addSubview(btn)
            
            //给按钮添加点击事件
            btn.addTarget(self, action: #selector(self.btnDidClicked), for: .touchUpInside)
        }
    }
    
    @objc private func btnDidClicked(sender: UIButton) {
        self.selectedBtn?.isSelected = false
        sender.isSelected = true
        self.selectedBtn = sender
        
    }
    
    //开始选号
    @IBAction func startRotateLucky(_ sender: UIButton) {
        //快速旋转转盘
        let angle = 2 * Double.pi 
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //布局子控件
        for i in (0..<self.rotateImageView.subviews.count) {
            //将所有btn添加到中心
            let view = self.rotateImageView.subviews[i]
            view.bounds = CGRect(x: 0, y: 0, width: 68, height: 143)
            view.center = rotateImageView.center
            
            //设置btn锚点：调整
            view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            //计算每一个btn旋转角度
            let angle = 2 * Double.pi / 12
            //设置btn旋转
            view.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double(i)))
        }
    }
    
    //定时器自动旋转：CADisplayLink
    func startRotate() {
        //创建毫秒级定时器：1s刷新60次：与屏幕同步
        let link = CADisplayLink(target: self, selector: #selector(LuckyView.rotate))
        //添加到运行循环
        link.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
    }
    
    @objc private func rotate() {
        //计算1次转动角度：一秒转60圈 -> 一秒一圈 -> 十秒一圈
        let angle = 2 * Double.pi / 60 / 10
        //添加2D(平面)动画: ***
//        self.rotateImageView.transform.rotated(by: CGFloat(angle * s * 10)) //这样只是改变了原来的没有设置到layer上
        self.rotateImageView.layer.setAffineTransform(self.rotateImageView.transform.rotated(by: CGFloat(angle)))
        
        //添加3D属性动画旋转：按钮点击位置错误BUG:核心动画作用在layer上UIView实际frame没有跟随CALayer去改变
//        self.rotateImageView.layer.add(self.rotateAnim, forKey: nil)
        
    }
    
    //切图：将大图切割成可用的小图:index是需要的图片下标
    private func clipImageWithBigImage(image: UIImage, index: Int) -> UIImage {
        //计算需要切图的宽高：* 屏幕缩放因子：系统会自动根据缩放因子计算像素点
        let width = image.size.width / 12 * UIScreen.main.scale
        let height = image.size.height * UIScreen.main.scale
        let x = width * CGFloat(index)
        let y = 0
        let rect = CGRect(x: x, y: CGFloat(y), width: width, height: height)
//        let image = CGImageCreateWithImageInRect(image.cgImage!, rect)
        let image = image.cgImage?.cropping(to: rect)
        
        //缩放图片
//        debugPrint("size ==== \(UIImage(cgImage: image!, scale: UIScreen.main.scale / 0.8, orientation: UIImageOrientation.up).size)")
        //图片太大缩放
        let targetImage = UIImage(cgImage: image!, scale: UIScreen.main.scale / 0.8, orientation: UIImageOrientation.up)
        return targetImage
    }
    
}
