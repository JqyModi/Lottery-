//
//  ZHViewController.m
//  07-彩票-基本框架
//
//  Created by 赵华 on 15/12/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHViewController ()

@end

@implementation ZHViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
  
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    NSLog(@"%@", NSStringFromCGSize(flow.itemSize));
}

- (void)didReceiveMemoryWarning {
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
