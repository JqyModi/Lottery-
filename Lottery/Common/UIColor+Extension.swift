//
//  UIColor+Extension.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
}
