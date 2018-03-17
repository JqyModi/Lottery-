//
//  UIView+Extension.swift
//  Lottery(彩票)
//
//  Created by mac on 2018/3/17.
//  Copyright © 2018年 modi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var x: CGFloat {
        set {
            var rect = frame
            rect.origin.x = newValue
            frame = rect
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            var rect = frame
            rect.origin.y = newValue
            frame = rect
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var w: CGFloat {
        set {
            var rect = frame
            rect.size.width = newValue
            frame = rect
        }
        get {
            return self.frame.size.width
        }
    }
    
    var h: CGFloat {
        set {
            var rect = frame
            rect.size.height = newValue
            frame = rect
        }
        get {
            return self.frame.size.height
        }
    }
    
}
