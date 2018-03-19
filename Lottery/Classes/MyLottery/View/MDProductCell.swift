//
//  MDProductCell.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imgaeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var product: MDProduct? {
        didSet {
            setupData()
        }
    }
    
    private func setupData() {
        self.imgaeView.image = UIImage(named: (product?.icon)!)
        //设置ImageView圆角
        self.imgaeView.layer.cornerRadius = 10
        self.imgaeView.layer.masksToBounds = true
        self.titleLabel.text = product?.title
    }
    

}
