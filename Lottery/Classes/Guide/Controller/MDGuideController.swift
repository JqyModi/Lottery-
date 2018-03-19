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
    
    init() {
        let layout = UICollectionViewFlowLayout()
        //设置布局属性
        //每页大小等于屏幕大小
        layout.itemSize = screenBounds.size
        debugPrint("itemSize  --->   \(layout.itemSize)")
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
        
        //添加到collectionView上
        self.collectionView?.addSubview(largeImageV)
        self.collectionView?.addSubview(largeTextImageV)
        self.collectionView?.addSubview(smallTextImageV)
        
        //设置位置
        largeTextImageV.y = screenHeight * 0.75
        smallTextImageV.y = screenHeight * 0.85
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


}
