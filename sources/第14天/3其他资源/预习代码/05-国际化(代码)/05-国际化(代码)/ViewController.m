//
//  ViewController.m
//  05-国际化(代码)
//
//  Created by apple on 15/11/5.
//  Copyright (c) 2015年 1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1.添加项目语言支持
    // 2.创建一个 strings 文件(Localizable.strings)
    // 3.点文件 右边有个 localize 的按钮 点!!!
    // 4.选中中文英文(右边)
    // 5.在不同的语言的strings的文件下 写 key:value
    // 6.使用 " NSLocalizedString(@"title", nil); " 根据key获取对应的value
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{

    NSString* title = NSLocalizedString(@"title", nil);
    NSString* message = NSLocalizedString(@"message", nil);
    NSString* cancel = NSLocalizedString(@"cancel", nil);

    // 弹出来alertView
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil, nil];
    //
    [alert show];
}

@end
