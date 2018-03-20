//
//  MDHelpController.swift
//  Lottery
//
//  Created by mac on 2018/3/20.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

class MDHelpController: UITableViewController {

    var questions: NSArray? = {
        var arr = NSArray()
        //解析json
        let path = Bundle.main.path(forResource: "help", ofType: "json")
        let data = NSData.init(contentsOfFile: path!)
        do{
            let tempArr: NSArray = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            let mutArr = NSMutableArray()
            for item in tempArr {
                let pro = MDHelp(dict: item as! [String : Any])
                mutArr.add(pro)
            }
            arr = mutArr
        }catch {
            debugPrint(error)
        }
        debugPrint("arr -----> \(arr)")
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (questions?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //简单Cell不自定义了
        let ID = "ID"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ID)
        }
        let help = self.questions?[indexPath.row] as! MDHelp
        //设置数据
        cell?.textLabel?.text = help.title
        //设置右侧箭头
        let iv = UIImageView(image: UIImage(named: "arrow_right"))
        iv.sizeToFit()
        cell?.accessoryView = iv
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //获取数据
        let help = questions![indexPath.row] as! MDHelp
        
        let v = MDHelpWebController()
        v.info = help
        //push
//        self.navigationController?.pushViewController(v, animated: true)
        //modal：用导航栏包装
        let nav = MDNavigationController(rootViewController: v)
        let cancelBtn = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(self.cancelDidClicked))
        v.navigationItem.leftBarButtonItem = cancelBtn
        v.navigationController?.navigationBar.tintColor = UIColor.white
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc private func cancelDidClicked() {
        //本质是谁创建谁关闭
        self.dismiss(animated: true, completion: nil)
    }
}
