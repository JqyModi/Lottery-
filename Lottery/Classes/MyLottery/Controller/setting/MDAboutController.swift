//
//  MDAboutController.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDAboutController: MDSettingController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置HeaderView
        let header = MDAboutHeaderView.headerViewFormXib()
        self.tableView.tableHeaderView = header
    }

}
