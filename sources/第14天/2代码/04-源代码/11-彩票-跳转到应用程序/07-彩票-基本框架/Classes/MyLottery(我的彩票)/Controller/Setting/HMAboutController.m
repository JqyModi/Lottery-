//
//  HMAboutController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMAboutController.h"
#import "HMAboutHeaderView.h"

@interface HMAboutController ()

@end

@implementation HMAboutController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置 header 头
    self.tableView.tableHeaderView = [HMAboutHeaderView aboutHeaderView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
