//
//  MDSettingController.swift
//  Lottery(彩票)
//
//  Created by Mac on 2018/3/18.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDSettingController: UITableViewController {
    
    var plistName: String = "" {
        didSet {
            initData()
        }
    }

    var groups: NSArray = NSArray()
//    var groups: NSArray = {
//        var arr = NSArray()
//        let path = Bundle.main.path(forResource: "setting", ofType: "plist")
//        arr = NSArray(contentsOfFile: path!)!
//        debugPrint("arr --> \(arr)")
//        return arr
//    }()
    
    
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
    
    private func initData() {
        var arr = NSArray()
        let path = Bundle.main.path(forResource: self.plistName, ofType: "plist")
        arr = NSArray(contentsOfFile: path!)!
        debugPrint("arr --> \(arr)")
        self.groups = arr
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
    
    private func getCellStyle(cs: String) -> UITableViewCellStyle {
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

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取组
        let group = groups.object(at: indexPath.section) as! NSDictionary
        let item = group["items"] as! NSArray
        let cellInfo = item[indexPath.row] as! NSDictionary
        
        let ID = "CELL"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            if let cellStyle = cellInfo["cellStyle"] as? String {
                cell = UITableViewCell(style: getCellStyle(cs: cellStyle), reuseIdentifier: ID)
            }else {
                cell = UITableViewCell(style: .default, reuseIdentifier: ID)
            }
        }
        
        //设置标题文字
        cell?.textLabel?.text = cellInfo["title"] as! String
        //设置副标题：为空默认不显示
        cell?.detailTextLabel?.text = cellInfo["subTitle"] as! String
        
        //设置图标
        if let icon = cellInfo["icon"] as? String {
            let image = UIImage(named: icon)
            cell?.imageView?.image = image
        }
        //通过plist中类型判断View类型在动态的设置accessoryView
        if let accesoryType = cellInfo["accessoryType"] as? String {
            let clz = NSClassFromString(accesoryType)
            debugPrint("view ---> \(clz)")
            let viewcls = clz as! UIView.Type
            let view = viewcls.init()
            if view.isKind(of: UIImageView.self) {
                let accesoryView = cellInfo["accessoryView"] as? String
                let iv = view as! UIImageView
                iv.image = UIImage(named: accesoryView!)
                //设置大小：否则不显示
                iv.sizeToFit()
            }
            cell?.accessoryView = view
        }
        
        return cell!
    }
    
    //处理点击事件
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //获取组
        let group = groups.object(at: indexPath.section) as! NSDictionary
        let item = group["items"] as! NSArray
        let cellInfo = item[indexPath.row] as! NSDictionary
        
        //判断targetVC   targetVC
        if let targetType = cellInfo["targetVC"] as? String {
            let vc = getVCByClassString(targetType)
            //判断是否是相同模板的设置界面跳转
            if (vc?.isKind(of: MDSettingController.self))! {
                let targetPlist = cellInfo["targetPlist"] as? String
                let targetVC = vc as! MDSettingController
                targetVC.plistName = targetPlist!
            }
            
            //设置控制器属性
            let title = cellInfo["title"] as? String
            vc?.title = title
            //跳转控制器
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
    }
}

//MARK: -- 根据类文件字符串转换为ViewController：自定义的类需要重写初始化方法：init否则报空nil
extension MDSettingController
{
    /// 类文件字符串转换为ViewController
    /// - Parameter childControllerName: VC的字符串
    /// - Returns: ViewController
    func getVCByClassString(_ childControllerName: String) -> UIViewController?{
        
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        // 2.通过命名空间和类名转换成类
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
        debugPrint(clsName)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return nil
        }
        // 3.通过Class创建对象
        let childController = clsType.init()
        
        return childController
    }
}
