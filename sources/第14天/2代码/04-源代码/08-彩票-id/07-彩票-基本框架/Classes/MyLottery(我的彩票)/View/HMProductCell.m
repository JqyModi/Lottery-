//
//  HMProductCell.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMProductCell.h"

@interface HMProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView* iconView;
@property (weak, nonatomic) IBOutlet UILabel* titleView;

@end

@implementation HMProductCell

- (void)setProduct:(HMProduct*)product
{
    _product = product;

    // 处理圆角
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;

    // 把数据放在对应的控件上

    self.iconView.image = [UIImage imageNamed:product.icon];
    self.titleView.text = product.title;
}

@end
