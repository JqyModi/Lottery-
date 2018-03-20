//
//  MDHelp.swift
//  Lottery
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDHelp: NSObject {
//    "title" : "如何提现？",
//    "html" : "help.html",
//    "id" : "howtowithdraw"
    @objc var title: String?
    @objc var html: String?
    @objc var id: String?
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["title", "html", "id"]).description
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
