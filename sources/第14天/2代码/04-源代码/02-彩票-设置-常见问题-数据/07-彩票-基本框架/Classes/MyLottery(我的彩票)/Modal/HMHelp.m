//
//  HMHelp.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMHelp.h"

@implementation HMHelp

+ (instancetype)helpWithDict:(NSDictionary*)dict
{
    HMHelp* h = [[self alloc] init];

    h.ids = dict[@"id"];
    h.title = dict[@"title"];
    h.html = dict[@"html"];

    return h;
}

@end
