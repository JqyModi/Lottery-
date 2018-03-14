//
//  HMHelpController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMHelpController.h"
#import "HMHelp.h"
#import "HMHelpWebController.h"
#import "HMNavigationController.h"

@interface HMHelpController ()

@property (nonatomic, strong) NSArray* helps;

@end

@implementation HMHelpController

// 懒加载 解析
- (NSArray*)helps
{
    if (!_helps) {
        // 1.获取文件路径
        NSString* path = [[NSBundle mainBundle] pathForResource:@"help" ofType:@"json"];

        // 2.转成 data
        NSData* data = [NSData dataWithContentsOfFile:path];

        // 3.通过 data 转成 临时数组
        NSArray* tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        // 4.初始化可变数组
        NSMutableArray* array = [NSMutableArray array];

        // 5.遍历临时数组 获取字典
        for (NSDictionary* dict in tempArray) {
            // 6.字典转模型
            HMHelp* h = [HMHelp helpWithDict:dict];

            // 7.把模型添加到可变数组当中
            [array addObject:h];
        }

        // 8.赋值
        _helps = array;
    }
    return _helps;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 设置标题
    self.title = @"常见问题";
}

// 点击 cell 调用
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{

    // 创建需要跳转到的控制器
    HMHelpWebController* vc = [[HMHelpWebController alloc] init];

    // 被数据传给下一个(web)控制器
    vc.help = self.helps[indexPath.row];

    // 包装 nav
    HMNavigationController* nav = [[HMNavigationController alloc] initWithRootViewController:vc];

    // 取消按钮
    UIBarButtonItem* cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelClick)];
    vc.navigationItem.leftBarButtonItem = cancelItem;

    // modal
    [self presentViewController:nav animated:YES completion:nil];
}

// 取消按钮
- (void)cancelClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 某一组有多少行
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.helps.count;
}

// cell样子
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    // id
    static NSString* cellid = @"help_cell";
    // 缓存池
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }

    // 赋值
    cell.textLabel.text = [self.helps[indexPath.row] title];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];

    return cell;
}

@end