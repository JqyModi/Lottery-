//
//  MDLiveSettingController.swift
//  Lottery
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 modi. All rights reserved.
//

import UIKit

//继承关系实现自己的选中事件
class MDLiveSettingController: MDSettingController {

    //引用当前日期选择器
    var datePic: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //初始化一个透明文本框
        let textField = UITextField()
        
        //将透明文本框添加到Cell上
        
        //获取Cell
        let selIndex = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: selIndex!)
        cell?.contentView.addSubview(textField)
        
        //自定义弹出键盘：替换为日期选择器：默认大小就是占据键盘位置
        let datePicker = UIDatePicker()
        self.datePic = datePicker
        //设置日期显示格式
        datePicker.datePickerMode = .time
        //设置中文
        datePicker.locale = Locale(identifier: "zh-cn")
        //替换键盘
        textField.inputView = datePicker
        //设置工具条显示：toolBar：默认没有Frame
        let toolBar = UIToolbar()
        toolBar.h = 44
        let leftItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(self.cancel))
        //弹簧效果
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let rightItem = UIBarButtonItem(title: "确定", style: .done, target: self, action: #selector(self.done))
        toolBar.items = [leftItem, flexibleSpace, rightItem]
        //替换键盘工具条为自定义工具条
        textField.inputAccessoryView = toolBar
        //设置第一响应者
        textField.becomeFirstResponder()
    }
    
    @objc private func cancel() {
        //结束编辑：取消键盘
        self.view.endEditing(true)
    }
    
    @objc private func done() {
        //获取当前时间显示到Cell上：新建的时间一样
        let date = self.datePic?.date
        let formart = DateFormatter()
        formart.dateFormat = "HH:mm"
        let time = formart.string(from: date!)
        debugPrint("time ----> \(time)")
        //将时间设置到DetailLabel
        //获取Cell
        let selIndex = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: selIndex!)
        cell?.detailTextLabel?.text = time
        
        self.cancel()
    }
}
