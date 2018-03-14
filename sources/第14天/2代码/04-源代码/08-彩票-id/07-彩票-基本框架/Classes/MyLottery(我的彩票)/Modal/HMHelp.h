//
//  HMHelp.h
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHelp : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* html;
@property (nonatomic, copy) NSString* ids;

+ (instancetype)helpWithDict:(NSDictionary*)dict;

@end
