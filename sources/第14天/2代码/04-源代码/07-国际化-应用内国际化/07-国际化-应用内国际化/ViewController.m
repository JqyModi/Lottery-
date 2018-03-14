//
//  ViewController.m
//  07-国际化-应用内国际化
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString* fileName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // * 因为是应用内的国际化 所有"不需要"添加对语言的支持

    // 1.新建多个strings 的文件 名字随便起

    // 2. 写 key value

    // 3.使用系统提供的 NSLocalizedStringFromTable(@"key", @"文件的名字", nil); 会把对应文件中 key 所对应的 value 返回给你

    self.fileName = @"lan_ch";
}
- (IBAction)cnClick:(id)sender
{
    self.fileName = @"lan_ch";
}

- (IBAction)enClick:(id)sender
{
    self.fileName = @"lan_en";
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    // 弹框

    NSString* title = NSLocalizedStringFromTable(@"title", self.fileName, nil);
    NSString* message = NSLocalizedStringFromTable(@"message", self.fileName, nil);
    NSString* commit = NSLocalizedStringFromTable(@"commit", self.fileName, nil);

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:commit otherButtonTitles:nil, nil];

    [alert show];
}

@end
