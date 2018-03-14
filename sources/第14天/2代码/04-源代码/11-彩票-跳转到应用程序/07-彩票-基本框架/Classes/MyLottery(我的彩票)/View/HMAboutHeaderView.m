//
//  HMAboutHeaderView.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMAboutHeaderView.h"

@implementation HMAboutHeaderView

+ (instancetype)aboutHeaderView
{
    return [[NSBundle mainBundle] loadNibNamed:@"HMAboutHeaderView" owner:nil options:nil][0];
}

@end
