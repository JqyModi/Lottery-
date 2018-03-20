//
//  MDHelpWebController.swift
//  Lottery
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDHelpWebController: UIViewController {

    var info: MDHelp? {
        didSet {
            setupData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
        setupUI()
        
        //设置数据
//        setupData()
    }

    private func setupUI() {
        self.view.addSubview(webV)
    }
    
    private func setupData() {
        //解析数据中的文件名并将本地文件路径转化为URL
        let url = Bundle.main.url(forResource: info?.html, withExtension: nil)
        //webview显示
        let request = URLRequest(url: url!)
        webV.loadRequest(request)
    }
    
    //懒加载一个WebView
    lazy var webV: UIWebView = {
        let webV = UIWebView()
        webV.frame = screenBounds
        webV.backgroundColor = UIColor.randomColor
        return webV
    }()
    
}
