//
//  HMProduct.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMProduct.h"

@implementation HMProduct

+ (instancetype)productWithDict:(NSDictionary*)dict
{
    HMProduct* p = [[self alloc] init];
    p.title = dict[@"title"];
    p.stitle = dict[@"stitle"];
    p.ids = dict[@"id"];
    p.url = dict[@"url"];
    p.icon = dict[@"icon"];
    p.customUrl = dict[@"customUrl"];
    return p;
}

@end
