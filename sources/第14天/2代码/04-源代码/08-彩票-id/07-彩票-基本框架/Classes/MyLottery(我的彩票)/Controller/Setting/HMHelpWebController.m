//
//  HMHelpWebController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMHelpWebController.h"

@interface HMHelpWebController () <UIWebViewDelegate>

@end

@implementation HMHelpWebController

// 把控制器 view 变成 WebView
- (void)loadView
{
    self.view = [[UIWebView alloc] initWithFrame:kScreenSize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 加载网页
    UIWebView* webView = (UIWebView*)self.view;

    // 设置代理
    webView.delegate = self;

    // 创建 url 对象
    NSURL* url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];

    // 通过一个统一资源定位符 包装成一个请求
    NSURLRequest* req = [NSURLRequest requestWithURL:url];

    // 加载请求
    [webView loadRequest:req];
}

// 网页加载完成调用
- (void)webViewDidFinishLoad:(UIWebView*)webView
{
    // 代码
    NSString* code = [NSString stringWithFormat:@"document.location.href = '#%@';", self.help.ids];
    [webView stringByEvaluatingJavaScriptFromString:code];
}

@end
