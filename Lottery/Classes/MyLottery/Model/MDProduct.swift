//
//  MDProduct.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDProduct: NSObject {
//    "title": "邮箱大师",
//    "stitle":"网易推出的通用邮箱APP",
//    "id": "com.netease.mailmaster",
//    "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
//    "icon": "mail",
//    "customUrl": "mailmaster"
    
    @objc var title: String?
    @objc var stitle: String?
    @objc var id: String?
    @objc var url: String?
    @objc var icon: String?
    @objc var customUrl: String?
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["title", "stitle", "id", "url", "icon", "customUrl"]).description
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
