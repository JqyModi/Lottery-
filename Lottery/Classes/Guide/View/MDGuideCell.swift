//
//  MDGuideCell.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDGuideCell: UICollectionViewCell {
    var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(imageView)
    }
    
    //懒加载子控件
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.frame = screenBounds
        return iv
    }()
}
