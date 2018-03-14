//
//  HMMyLotteryController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMMyLotteryController.h"
#import "HMSettingController.h"
#import "HMHelpController.h"

@interface HMMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton* loginButton;

@end

@implementation HMMyLotteryController

// 跳转到 设置界面
- (IBAction)settingClick:(id)sender
{
    // 跳转到设置
    HMSettingController* setting = [[HMSettingController alloc] init];
    // 传入 plist 名字
    setting.plistName = @"Setting";

    // 设置 常见问题 按钮
    UIBarButtonItem* helpItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(helpClick)];
    setting.navigationItem.rightBarButtonItem = helpItem;

    // 设置标题
    setting.navigationItem.title = @"设置";
    [self.navigationController pushViewController:setting animated:YES];
}

// 点击 常见问题 事件
- (void)helpClick
{

    // 跳转到 常见问题的 tableViewController
    HMHelpController* vc = [[HMHelpController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 获取图片
    UIImage* image = [UIImage imageNamed:@"RedButton"];
    // 中间1像素拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    // 设置按钮的背景图片
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];

    // 获取图片
    UIImage* imagePressed = [UIImage imageNamed:@"RedButtonPressed"];
    // 中间1像素拉伸
    imagePressed = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width * 0.5 topCapHeight:imagePressed.size.height * 0.5];
    // 设置按钮的背景图片
    [self.loginButton setBackgroundImage:imagePressed forState:UIControlStateHighlighted];
}

@end
