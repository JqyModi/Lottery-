//
//  LuckyView.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/15.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class LuckyView: UIView {
    
    //
    @IBOutlet weak var rotateImageView: UIImageView!
    
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
            //添加到View
            self.rotateImageView.addSubview(btn)
        }
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
