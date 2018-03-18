//
//  MDRedeemCodeController.swift
//  Lottery(彩票)
//
//  Created by Mac on 2018/3/18.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDRedeemCodeController: UIViewController {

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
    }
    

    
    
}
