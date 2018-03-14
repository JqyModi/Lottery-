//
//  ViewController.m
//  06-国际化(应用内国际化)
//
//  Created by apple on 15/11/5.
//  Copyright (c) 2015年 1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy, nonatomic) NSString* fileName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1.创建两个strings的文件(名字自己把握)
    // 2.NSLocalizedStringFromTable(<#key#>, <#tbl#>, <#comment#>)
    // 从tbl文件中取到key值

    self.fileName = @"lan_cn";
}
- (IBAction)cnClick:(id)sender
{
    self.fileName = @"lan_cn";
}

- (IBAction)enClick:(id)sender
{
    self.fileName = @"lan_en";
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    // alertView

    NSString* title = NSLocalizedStringFromTable(@"title", self.fileName, nil);
    NSString* message = NSLocalizedStringFromTable(@"message", self.fileName, nil);
    NSString* cancel = NSLocalizedStringFromTable(@"cancel", self.fileName, nil);

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil, nil];

    // show
    [alert show];
}

@end
