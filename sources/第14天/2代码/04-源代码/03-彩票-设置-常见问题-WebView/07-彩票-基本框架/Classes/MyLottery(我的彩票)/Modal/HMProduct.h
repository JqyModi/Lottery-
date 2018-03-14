//
//  HMProduct.h
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMProduct : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* stitle;
@property (nonatomic, copy) NSString* ids;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* icon;
@property (nonatomic, copy) NSString* customUrl;

+ (instancetype)productWithDict:(NSDictionary*)dict;

@end
