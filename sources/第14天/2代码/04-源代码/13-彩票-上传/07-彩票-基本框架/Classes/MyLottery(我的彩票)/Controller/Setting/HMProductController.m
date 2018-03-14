//
//  HMProductController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMProductController.h"
#import "HMProduct.h"
#import "HMProductCell.h"

@interface HMProductController ()

@property (nonatomic, strong) NSArray* products;

@end

@implementation HMProductController
// 懒加载 解析
- (NSArray*)products
{
    if (!_products) {
        // 1.获取文件路径
        NSString* path = [[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"];

        // 2.把文件转化成 data
        NSData* data = [NSData dataWithContentsOfFile:path];

        // 3.通过 data 转化成 array
        NSArray* tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        // 4.初始化一个可变数组
        NSMutableArray* array = [NSMutableArray array];

        // 5.遍历临时数组 获取字典
        for (NSDictionary* dict in tempArray) {

            // 6.通过字典转模型
            HMProduct* p = [HMProduct productWithDict:dict];

            // 7.把模型添加到可变数组当中
            [array addObject:p];
        }

        // 8.赋值
        _products = array;
    }
    return _products;
}

- (instancetype)init
{

    // 创建 layout
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];

    // item大小
    layout.itemSize = CGSizeMake(80, 80);
    // item左右最小的距离
    layout.minimumInteritemSpacing = 0;
    // 组内边距
    layout.sectionInset = UIEdgeInsetsMake(16, 0, 0, 0);

    // 设置 layout 参数

    return [super initWithCollectionViewLayout:layout];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout*)layout
{
    return [self init];
}
#pragma clang diagnostic pop

static NSString* const reuseIdentifier = @"product_cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib* nib = [UINib nibWithNibName:@"HMProductCell" bundle:nil];

    // 注册单元格
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];

    // 修改 collView 的背景颜色
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.91 green:0.93 blue:0.93 alpha:1];
}

// collectionView 点击事件
- (void)collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    // 点击这个 cell 的模型
    HMProduct* p = self.products[indexPath.row];

    // 获取 app 对象
    UIApplication* app = [UIApplication sharedApplication];

    // 获取 本地程序的 url
    NSURL* appUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@", p.customUrl, p.ids]];

    // 获取 AppStore  url
    NSURL* storeUrl = [NSURL URLWithString:p.url];

    // ----- iOS9 -----
    if (![app openURL:appUrl]) {
        // 如果本地没有这个应用程序 那么打开 AppStore 并且显示相应程序的页面
        [app openURL:storeUrl];
    }

    // ----- iOS9 -----

    //    // ----- iOS8 -----
    //
    //    // 判断 本地是否有这个应用程序 (本地的应用程序是否能被打开)
    //    if ([app canOpenURL:appUrl]) {
    //        // 如果本地有这个应用程序 那么打开
    //
    //    } else {
    //        // 如果本地没有这个应用程序 那么打开 AppStore 并且显示相应程序的页面
    //
    //    }
    //
    //    // ----- iOS8 -----
}

// 有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

// 某一组有多上行
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    // 缓存池找
    HMProductCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // 把模型(数据)传给 cell
    cell.product = self.products[indexPath.row];

    return cell;
}

@end
