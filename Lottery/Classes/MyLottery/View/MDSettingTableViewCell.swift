//
//  MDSettingTableViewCell.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDSettingTableViewCell: UITableViewCell {

    var cellInfo: NSDictionary = [:] {
        didSet {
            setupData()
        }
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupData() {
        //设置标题文字
        self.textLabel?.text = cellInfo["title"] as? String
        //设置副标题：为空默认不显示
        self.detailTextLabel?.text = cellInfo["subTitle"] as? String
        
        //判断副标题是否有特定颜色
        if let subColor = cellInfo["subTitleColor"] as? String {
            debugPrint("subColor ----> \(subColor)")
            self.detailTextLabel?.textColor = UIColor.red
        }
        
        //设置图标
        if let icon = cellInfo["icon"] as? String {
            let image = UIImage(named: icon)
            self.imageView?.image = image
        }
        //通过plist中类型判断View类型在动态的设置accessoryView
        if let accesoryType = cellInfo["accessoryType"] as? String {
            let clz = NSClassFromString(accesoryType)
//            debugPrint("view ---> \(clz)")
            let viewcls = clz as! UIView.Type
            let view = viewcls.init()
            if view.isKind(of: UIImageView.self) {
                let accesoryView = cellInfo["accessoryView"] as? String
                let iv = view as! UIImageView
                iv.image = UIImage(named: accesoryView!)
                //设置大小：否则不显示
                iv.sizeToFit()
            }
            self.accessoryView = view
        }
    }
    
    class func cellForItem(tableView: UITableView, item: NSDictionary) -> MDSettingTableViewCell {
        
        //重用ID：当Cell的style类型不同时用同一个ID会出现两种不同类型的Cell错误显示：不同类型需要设置不同重用ID
        var ID = "CELL"
        if let cellStyle = item["cellStyle"] as? String {
            ID = cellStyle
        }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ID) as? MDSettingTableViewCell
        if cell == nil {
            if let cellStyle = item["cellStyle"] as? String {
                cell = MDSettingTableViewCell(style: getCellStyle(cs: cellStyle), reuseIdentifier: ID)
            }else {
                cell = MDSettingTableViewCell(style: .default, reuseIdentifier: ID)
            }
        }
        return cell!
    }
    
    class private func getCellStyle(cs: String) -> UITableViewCellStyle {
        var style: UITableViewCellStyle?
        switch cs {
        case "default":
            style = UITableViewCellStyle.default
        case "value1":
            style = UITableViewCellStyle.value1
        case "value2":
            style = UITableViewCellStyle.value2
        case "subtitle":
            style = UITableViewCellStyle.subtitle
        default:
            style = UITableViewCellStyle.default
        }
        return style!
    }

}
