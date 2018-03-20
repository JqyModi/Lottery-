//
//  MDGuideController.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

/**
 *  Desc: 用UICollectionView做新特性界面可以复用
 *  Param:
 */
class MDGuideController: UICollectionViewController {
    
    var largeImageV: UIImageView?
    var largeTextImageV: UIImageView?
    var smallTextImageV: UIImageView?
    
    var page: CGFloat = 0
    
    init() {
        let layout = UICollectionViewFlowLayout()
        //设置布局属性
        //每页大小等于屏幕大小
        layout.itemSize = screenBounds.size
//        layout.itemSize = CGSize(width: 375, height: 600)
        debugPrint("itemSize  --->   \(layout.itemSize)")
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        //设置滚动方向
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = defaultBackgroundColor
        setupUI()
        configStyle()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(MDGuideCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        //添加动画图片到collectionView上不跟随Cell滑动：要滑动改变x或y值即可
        //获取图片
        let largeImageV = UIImageView(image: UIImage(named: "guide1"))
        let largeTextImageV = UIImageView(image: UIImage(named: "guideLargeText1"))
        let smallTextImageV = UIImageView(image: UIImage(named: "guideSmallText1"))
        
        self.largeImageV = largeImageV
        self.largeTextImageV = largeTextImageV
        self.smallTextImageV = smallTextImageV
        
        //添加到collectionView上
        self.collectionView?.addSubview(largeImageV)
        self.collectionView?.addSubview(largeTextImageV)
        self.collectionView?.addSubview(smallTextImageV)
        
        //设置位置
        largeTextImageV.y = screenHeight * 0.75
        smallTextImageV.y = screenHeight * 0.85
        
        //设置开始体验按钮位置
        let startBtn = UIButton()
//        startBtn.setTitle("开始体验", for: .normal)
        startBtn.setBackgroundImage(UIImage(named: "guideStart"), for: .normal)
        //设置大小
        startBtn.sizeToFit()
        //设置位置
        let x = 3.5 * screenWidth
        startBtn.center = CGPoint(x: x, y: screenHeight * 0.93)
        //添加到collectionView上
        collectionView?.addSubview(startBtn)
        
        //监听按钮点击事件
        startBtn.addTarget(self, action: #selector(self.startBtnDidClicked), for: .touchUpInside)
    }
    
    @objc private func startBtnDidClicked() {
        //替换根控制器
        
        //1.获取主窗口
        let keyWindow = UIApplication.shared.keyWindow
        //设置根控制器
        keyWindow?.rootViewController = MDTabBarViewController()
    }
    
    private func configStyle() {
        //隐藏滚动条
        self.collectionView?.showsHorizontalScrollIndicator = false
        //设置分页效果
        self.collectionView?.isPagingEnabled = true
        //取消滚动到边缘页码的弹簧效果
        self.collectionView?.bounces = false
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MDGuideCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.randomColor
        //获取图片
        let imgName = "guide\(indexPath.item + 1)Background"
        let image = UIImage(named: imgName)
        cell.image = image
        return cell
    }

    // MARK: UICollectionViewDelegate

    // MARK: UIScrollViewDelegate
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //减速时将图片偏移量改变为当前Cell偏移的offset
        
        //滚动之前更改对应图片
        let offsetX = scrollView.contentOffset.x
        let page = offsetX / screenWidth
        debugPrint("page ---> \(page)")
        //获取图片
        let largeImage = UIImage(named: "guide\(page+1)")
        let largeTextImage = UIImage(named: "guideLargeText\(page+1)")
        let smallTextImage = UIImage(named: "guideSmallText\(page+1)")
        
        self.largeImageV?.image = largeImage
        self.largeTextImageV?.image = largeTextImage
        self.smallTextImageV?.image = smallTextImage
        
        //设置图片滑动方向跟手势滑动方向一致：改变x来实现
        if self.page > page {
            //从左往右
            debugPrint("123")
            self.largeImageV?.x = scrollView.contentOffset.x - page * screenWidth
            self.largeTextImageV?.x = scrollView.contentOffset.x - page * screenWidth
            self.smallTextImageV?.x = scrollView.contentOffset.x - page * screenWidth
        }else {
            //从右往左
            debugPrint("321")
            self.largeImageV?.x = scrollView.contentOffset.x + page * screenWidth
            self.largeTextImageV?.x = scrollView.contentOffset.x + page * screenWidth
            self.smallTextImageV?.x = scrollView.contentOffset.x + page * screenWidth
        }
        
        self.page = page
        
        //1.获取View：通过引用获取
        //2.改变x = offset
        //以动画方式移动
        UIView.animate(withDuration: 0.25) {
            self.largeImageV?.x = scrollView.contentOffset.x
            self.largeTextImageV?.x = scrollView.contentOffset.x
            self.smallTextImageV?.x = scrollView.contentOffset.x
        }
        
    }
    
}
