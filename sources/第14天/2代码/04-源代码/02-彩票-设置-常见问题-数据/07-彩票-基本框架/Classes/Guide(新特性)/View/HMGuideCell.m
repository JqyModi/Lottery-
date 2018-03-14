//
//  HMGuideCell.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMGuideCell.h"

@interface HMGuideCell ()

@property (nonatomic, weak) UIImageView* imageView;

@end

@implementation HMGuideCell

// 懒加载创建 imageView
- (UIImageView*)imageView
{
    if (!_imageView) {
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.frame = kScreenSize;
        [self addSubview:imageView];

        _imageView = imageView;
    }
    return _imageView;
}

- (void)setImage:(UIImage*)image
{
    _image = image;

    // 把数据放在控件上

    self.imageView.image = image;
}

@end
