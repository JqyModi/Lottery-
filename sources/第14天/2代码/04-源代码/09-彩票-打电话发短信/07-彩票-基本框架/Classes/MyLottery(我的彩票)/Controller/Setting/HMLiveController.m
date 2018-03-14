//
//  HMLiveController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMLiveController.h"
#import "UIView+Frame.h"

@interface HMLiveController ()

@property (nonatomic, weak) UIDatePicker* datePicker;

@end

@implementation HMLiveController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    // 第一组不点
    if (indexPath.section == 0) {
        return;
    }

    // 创建一个看不见的文本框
    UITextField* text = [[UITextField alloc] init];

    // 获取 cell
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];

    // 添加到 cell 上
    [cell.contentView addSubview:text];

    // 创建 datePicker
    UIDatePicker* datePicker = [[UIDatePicker alloc] init];
    self.datePicker = datePicker;

    // 中文
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];

    // 时间格式
    datePicker.datePickerMode = UIDatePickerModeTime;

    // 设置文本框的 inputView
    text.inputView = datePicker;

    // 创建 toolbar
    UIToolbar* bar = [[UIToolbar alloc] init];

    // 设置告诉
    bar.h = 44;

    // item - 取消
    UIBarButtonItem* cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];

    // item - 弹簧
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    // item - 完成
    UIBarButtonItem* doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick)];

    // 设置 toolbar 的 item
    bar.items = @[ cancelItem, item, doneItem ];

    // 设置文本框的 inputAccessoryView
    text.inputAccessoryView = bar;

    // 让文本框成为第一响应者
    [text becomeFirstResponder];
}

// 收键盘
- (void)cancelClick
{
    [self.view endEditing:YES];
}

// 完成按钮点击事件
- (void)doneClick
{

    // 获取 datePicker 的时间
    NSDate* date = self.datePicker.date;
    // 创建格式化时间的对象
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    // 设置格式化时间对象的格式
    formatter.dateFormat = @"HH:mm";
    // 把date 转成 string
    NSString* time = [formatter stringFromDate:date];

    // 获取 indexPath
    NSIndexPath* path = [self.tableView indexPathForSelectedRow];

    // 获取 cell
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:path];

    // 修改时间
    cell.detailTextLabel.text = time;

    // 点取消
    [self cancelClick];
}

@end
