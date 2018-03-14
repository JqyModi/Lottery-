//
//  HMGuideController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMGuideController.h"
#import "HMGuideCell.h"
#import "UIView+Frame.h"
#import "HMTabBarController.h"

@interface HMGuideController ()

@property (nonatomic, weak) UIImageView* largeImageView;
@property (nonatomic, weak) UIImageView* largeTextImageView;
@property (nonatomic, weak) UIImageView* smallTextImageView;

@property (nonatomic, assign) int page; // 用来记录上一次的页数 判断方向

@end

@implementation HMGuideController

- (instancetype)init
{

    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];

    // item大小
    layout.itemSize = kScreenSize.size;

    // 间距
    layout.minimumLineSpacing = 0;

    // 滑动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    return [super initWithCollectionViewLayout:layout];
}

static NSString* const reuseIdentifier = @"guide_cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 注册单元格
    [self.collectionView registerClass:[HMGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];

    // 分页
    self.collectionView.pagingEnabled = YES;

    // 取消滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;

    // 取消弹性效果
    self.collectionView.bounces = NO;

    // 大图片
    UIImageView* largeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];

    // 大文字
    UIImageView* largeTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeTextImageView.y = kScreenHeight * 0.75;

    // 小文字
    UIImageView* smallTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallTextImageView.y = kScreenHeight * 0.85;

    // 把图片添加到 collectionView 中
    [self.collectionView addSubview:largeImageView];
    [self.collectionView addSubview:largeTextImageView];
    [self.collectionView addSubview:smallTextImageView];

    // 给全局属性赋值
    self.largeImageView = largeImageView;
    self.largeTextImageView = largeTextImageView;
    self.smallTextImageView = smallTextImageView;

    // 添加波浪线图片
    UIImage* image = [UIImage imageNamed:@"guideLine"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.x = -220;
    [self.collectionView addSubview:imageView];

    // 添加"立即体验"按钮
    UIButton* enterButton = [[UIButton alloc] init];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [enterButton sizeToFit];
    enterButton.x = 3 * kScreenWidth + (kScreenWidth - enterButton.w) * 0.5;
    enterButton.y = kScreenHeight * 0.9;
    [self.collectionView addSubview:enterButton];
    // 监听立即体验的点击事件
    [enterButton addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
}

// 立即体验的按钮
- (void)enterClick
{
    // 创建 tabbarController
    HMTabBarController* tab = [[HMTabBarController alloc] init];

    // 切换 window 的根控制器
    UIWindow* win = [UIApplication sharedApplication].keyWindow;
    win.rootViewController = tab;

    //    // modal // 虽然能够实现效果 但是不应该这样写
    //    [self presentViewController:tab animated:NO completion:nil];
}

// 监听 collectionView 滑动完成(scrollView减速完成)
- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    // 获取到scrollView 的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;

    // 获取页数
    int page = offsetX / kScreenWidth;

    // 获取图片的名字
    NSString* largeImageName = [NSString stringWithFormat:@"guide%zd", page + 1];
    NSString* largeTextImageName = [NSString stringWithFormat:@"guideLargeText%zd", page + 1];
    NSString* smallTextImageName = [NSString stringWithFormat:@"guideSmallText%zd", page + 1];

    // 更换图片
    self.largeImageView.image = [UIImage imageNamed:largeImageName];
    self.largeTextImageView.image = [UIImage imageNamed:largeTextImageName];
    self.smallTextImageView.image = [UIImage imageNamed:smallTextImageName];

    // 判断方向
    if (self.page > page) {
        // 在做动画之前 先改变图片的 x
        // 从左往右
        self.largeImageView.x = offsetX - kScreenWidth;
        self.largeTextImageView.x = offsetX - kScreenWidth;
        self.smallTextImageView.x = offsetX - kScreenWidth;
    }
    else {
        // 在做动画之前 先改变图片的 x
        // 从右往左
        self.largeImageView.x = offsetX + kScreenWidth;
        self.largeTextImageView.x = offsetX + kScreenWidth;
        self.smallTextImageView.x = offsetX + kScreenWidth;
    }

    // 加特技
    [UIView animateWithDuration:0.25
                     animations:^{
                         // 把介绍图片的 x 变到 偏移量的位置
                         self.largeImageView.x = offsetX;
                         self.largeTextImageView.x = offsetX;
                         self.smallTextImageView.x = offsetX;
                     }];

    self.page = page;
}

// 有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

// 某一组有多少行
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

// cell样子
- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    // 去缓存池找
    HMGuideCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // 获取图片
    NSString* imageName = [NSString stringWithFormat:@"guide%zdBackground", indexPath.row + 1];
    UIImage* image = [UIImage imageNamed:imageName];

    // 把数据(图片 ,  或者可能是模型 可能是数组 可能是字典)传给cell
    cell.image = image;

    return cell;
}

@end
