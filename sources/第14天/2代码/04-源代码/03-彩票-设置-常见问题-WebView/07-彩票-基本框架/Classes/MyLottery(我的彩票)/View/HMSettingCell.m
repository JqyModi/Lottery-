//
//  HMSettingCell.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMSettingCell.h"

@implementation HMSettingCell

+ (instancetype)settingCellWithTableView:(UITableView*)tableView andItem:(NSDictionary*)item
{

    //    static NSString* cellid = @"setting_cell";

    // 解决 cell 重用:
    // 创建 cell 的时候 根绝不同的类型 填写不同的 id
    // 下一次服用的时候 只要根据某一个类型的 id 去找那么一定找到的就是对应的类型
    NSString* cellid = @"";
    if (item[@"cellType"] && [item[@"cellType"] length] > 0) {
        cellid = item[@"cellType"];
    }
    else {
        cellid = @"setting_cell";
    }

    // 缓存池找
    HMSettingCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[HMSettingCell alloc] initWithStyle:[self loadCellStyleWithItem:item] reuseIdentifier:cellid];
    }

    cell.item = item;

    return cell;
}

- (void)setItem:(NSDictionary*)item
{
    _item = item;

    // 把数据放到 cell 上

    // 赋值
    if (item[@"icon"] && [item[@"icon"] length] > 0) {
        self.imageView.image = [UIImage imageNamed:item[@"icon"]]; // ---设置图片
    }

    self.textLabel.text = item[@"title"]; // ---设置标题

    self.detailTextLabel.text = item[@"subTitle"]; // ---设置子标题

    // 判断是否需要设置成红色
    if ([item[@"isRed"] boolValue] && item[@"isRed"]) {
        self.detailTextLabel.textColor = [UIColor redColor]; // ---设置子标题颜色
    }

    // 根据字符创生成对象======
    NSString* accessoryType = item[@"accessoryType"]; // 获取到 UISwith的字符串   @"UISwitch"
    Class Clz = NSClassFromString(accessoryType); // 获取 UISwitch的类型 UISwitch
    UIView* obj = [[Clz alloc] init]; // 获取 UISwitch类型的对象

    // 判断 obj 真实的类型
    if ([obj isKindOfClass:[UIImageView class]]) {
        // 设置 frame,图片
        UIImageView* imageView = (UIImageView*)obj;
        imageView.image = [UIImage imageNamed:item[@"accessoryContent"]];
        [imageView sizeToFit];
    }
    else if ([obj isKindOfClass:[UISwitch class]]) {
        // 如果是开关的类型 那么监听
        UISwitch* switcher = (UISwitch*)obj;
        [switcher addTarget:self action:@selector(switcherChange:) forControlEvents:UIControlEventValueChanged];

        // 从 ud 读取开关状态
        NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
        switcher.on = [ud boolForKey:item[@"switchKey"]];
    }

    self.accessoryView = obj; // ---设置accessoryView
}

// 开关状态改变的时候调用
- (void)switcherChange:(UISwitch*)sender
{
    // ud 单例
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    // 保存
    [ud setBool:sender.isOn forKey:self.item[@"switchKey"]];
}

// 根据传入的 cell 的类型 返回需要创建的 cell 的类型
+ (UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary*)item
{

    if ([item[@"cellType"] isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    }
    else if ([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }
    else if ([item[@"cellType"] isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    }
    else {
        return UITableViewCellStyleDefault;
    }
}

@end
