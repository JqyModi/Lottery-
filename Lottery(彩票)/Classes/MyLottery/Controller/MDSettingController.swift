//
//  MDSettingController.swift
//  Lottery(彩票)
//
//  Created by Mac on 2018/3/18.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDSettingController: UITableViewController {

    var groups: NSArray = {
        var arr = NSArray()
        let path = Bundle.main.path(forResource: "setting", ofType: "plist")
        arr = NSArray(contentsOfFile: path!)!
        debugPrint("arr --> \(arr)")
        return arr
    }()
    
    
    //重写构造方法实现分组table
    convenience init() {
        self.init(style: UITableViewStyle.grouped)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (groups.count)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //获取组
        let group = groups.object(at: section) as! NSDictionary
        let item = group["items"] as! NSArray
        return (item.count)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "CELL"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ID)
        }
        //获取组
        let group = groups.object(at: indexPath.section) as! NSDictionary
        let item = group["items"] as! NSArray
        let cellInfo = item[indexPath.row] as! NSDictionary
        
        //设置标题文字
        cell?.textLabel?.text = cellInfo["title"] as! String
        //设置图标
        let icon = cellInfo["icon"] as! String
        if !icon.isEmpty {
            let image = UIImage(named: icon)
            cell?.imageView?.image = image
        }
        return cell!
    }
    
}
