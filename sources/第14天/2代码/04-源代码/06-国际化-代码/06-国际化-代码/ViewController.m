//
//  ViewController.m
//  06-国际化-代码
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1.添加程序对语言的支持

    // 2.创建一个Localizable.strings (名字不要乱写!!!!!)

    // 3.点击文件 右边打钩!!

    // 4.展开箭头 中英文写 key value

    // 5. key 随便写 保证使用的时候 是这个 key 就可以

    // 6. value 中文写中文 英文写英文

    // 7.在用代码使用字符创的时候 使用 系统提供的 NSLocalizedString(@"key",nil); (系统会自动去找 Localizable.strings当中 对应的 key 并且返回 value)
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 弹框

    NSString* title = NSLocalizedString(@"title", nil);
    NSString* message = NSLocalizedString(@"message", nil);
    NSString* commit = NSLocalizedString(@"commit", nil);

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:commit otherButtonTitles:nil, nil];

    [alert show];
}

@end
