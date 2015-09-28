//
//  ZZCBaseViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCBaseViewController.h"
#import "ZZCHomeViewController.h"
#import "ZZCDestinationsViewController.h"
#import "ZZCOutLineViewController.h"
#import "ZZCHomeArticlesCell.h"
#import "ZZCBaseHeader.h"
#import "ZZCBaseFooter.h"

@interface ZZCBaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZZCBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createSegmentedControl];
    }
    return self;
}

#pragma mark - ================= 界面触发方法 =================
- (void)viewDidLoad
{
    [super viewDidLoad]; 
    [self createContentView];
    [self createList];
}

#pragma mark - ================= 创建主视图 =================
- (void)createContentView
{
    _contentView = [[ZZCBaseView alloc]init];
    _contentView.frame = CGRectMake(-330, 106, 640, 568 - 106 - 49);
    self.automaticallyAdjustsScrollViewInsets = NO;
//    _contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_contentView];
    //tabBar 和ScrollView同时使用 会产生偏移时 写下面这行代码即可解决 ！！！
}

#pragma mark - ================= 创建初始化collectionView =================
- (void)createList
{
    UICollectionViewFlowLayout *leftLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //设置item的大小
    leftLayout.itemSize = CGSizeMake(15, 220);
    //设置行间距
    leftLayout.minimumLineSpacing = 6;
    //设置item间距
    leftLayout.minimumInteritemSpacing = 6;
    //设置段间距
    leftLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
//    UICollectionViewFlowLayout *layout = [self setLayoutWithCollectionView];
    
    _leftCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(340, 0, 300, 568 - 106 - 49) collectionViewLayout:leftLayout];

    _leftCollectionView.tag = 10;
    
    //注册 cell
    [self registerCellWithUICollectionView:_leftCollectionView];
    
    //注册段头
    [_leftCollectionView registerClass:[ZZCBaseHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader /*注册段头*/withReuseIdentifier:@"L_head"];
    //注册段尾
    [_leftCollectionView registerClass:[ZZCBaseFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter /*注册段尾*/withReuseIdentifier:@"L_foot"];
    
    _leftCollectionView.dataSource = self;
    _leftCollectionView.delegate = self;
    
    _leftCollectionView.backgroundColor = [UIColor whiteColor];

    [_contentView addSubview:_leftCollectionView];

    
    
    UICollectionViewFlowLayout *rightLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置item的大小
    rightLayout.itemSize = CGSizeMake(15, 220);
    //设置行间距
    rightLayout.minimumLineSpacing = 6;
    //设置item间距
    rightLayout.minimumInteritemSpacing = 6;
    //设置段间距
    rightLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    _rightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 300, 568 - 106 - 49) collectionViewLayout:rightLayout];

    _rightCollectionView.tag = 11;
    
    [self registerCellWithUICollectionView:_rightCollectionView];
    
    //注册段头
    [_rightCollectionView registerClass:[ZZCBaseHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader /*注册段头*/withReuseIdentifier:@"R_head"];
    //注册段尾
    [_rightCollectionView registerClass:[ZZCBaseFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter /*注册段尾*/withReuseIdentifier:@"R_foot"];
    _rightCollectionView.dataSource = self;
    _rightCollectionView.delegate = self;
    
    _rightCollectionView.backgroundColor = [UIColor whiteColor];

    [_contentView addSubview:_rightCollectionView];

}
#pragma mark - ================= 注册Cell方法 =================

- (void)registerCellWithUICollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 10)
    {
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"LB_cell"];
    }
    else if (collectionView.tag == 11)
    {
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"RB_cell"];
    }
}

//************************** CollectionView 代理方法 ***************************//

#pragma mark - ================= 设置 section和item 的个数 =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 11)
    {
        return 10;
    }
    else if (collectionView.tag == 10)
    {
        return 10;
    }
    else
        return 0;
}

#pragma mark - ================= 加载 item 的数据 =================
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 10)
    {
        ZZCHomeTripsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LB_cell" forIndexPath:indexPath];
        
        [self updateTabViewCell:cell collectionView:collectionView indexpath:indexPath];
        return cell;
    }
    else
    {
        
    ZZCHomeArticlesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RB_cell" forIndexPath:indexPath];
    
    [self updateTabViewCell:cell collectionView:collectionView indexpath:indexPath];
    
    return cell;
    }

}

//提供刷新数据接口
- (void)updateTabViewCell:(UICollectionViewCell *)cell collectionView:(UICollectionView *)collectionView indexpath:(NSIndexPath *)indexpath
{
    
}

#pragma mark - ================= 修改 item 的大小 =================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(300,200);
}

#pragma mark - ================= 修改 外边距 =================
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - ================= 修改 行间距 和 列间距 =================
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 6.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 6.0;
}

#pragma mark - ================= 修改 Header和Footer 的size =================

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}
#pragma mark - ================= 加载 Header和Footer 的数据 =================
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *v;
    if (collectionView.tag == 10)
    {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"L_head" forIndexPath:indexPath];
        }
        else if([kind isEqualToString:UICollectionElementKindSectionFooter])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"L_foot" forIndexPath:indexPath];
        }
        return v;
    }
    else
    {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"R_head" forIndexPath:indexPath];
        }
        else if([kind isEqualToString:UICollectionElementKindSectionFooter])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"R_foot" forIndexPath:indexPath];
        }
        return v;
    }
}

#pragma mark - ================= item选中触发方法 =================
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - ================= 创建分段控制器 =================
- (void)createSegmentedControl
{
    if ([self isKindOfClass:[ZZCHomeViewController class]])
    {
        _SegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"游记", @"专题"]];
    }
    else if([self isKindOfClass:[ZZCDestinationsViewController class]])
    {
        _SegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"国外", @"国内"]];
    }
    else if([self isKindOfClass:[ZZCOutLineViewController class]])
    {
        _SegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"游记", @"目的地"]];
    }
    
    [_SegmentedControl addTarget:self action:@selector(SegClick) forControlEvents:UIControlEventValueChanged];
    _SegmentedControl.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    _SegmentedControl.segmentIndicatorBackgroundColor = [UIColor whiteColor];
    _SegmentedControl.segmentIndicatorInset = 0.0f;
    _SegmentedControl.titleTextColor = ZZCColor(48, 148, 221);
    _SegmentedControl.selectedTitleTextColor = ZZCColor(48, 148, 221);
    [_SegmentedControl sizeToFit];
    _SegmentedControl.frame = CGRectMake(10, 70, 300 , 30);
    
    [self.view addSubview:_SegmentedControl];
}
- (void)SegClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    if (_isChange)
    {
        _contentView.frame = CGRectMake(-330, 106, 640, 568 - 112 - 49);
    }
    else
    {
        _contentView.frame = CGRectMake(10, 106, 640, 568 - 112 - 49);

    }
    [UIView commitAnimations];
    _isChange = !_isChange;
}

@end
