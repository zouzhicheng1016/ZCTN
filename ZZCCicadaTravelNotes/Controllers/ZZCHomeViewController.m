//
//  ZZCHomeViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCHomeViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCHomeTripsModel.h"
#import "ZZCHomeArticlesModel.h"
#import "ZZCHomeTripsCell.h"
#import "ZZCHomeArticlesCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "ZZCTripsDetailViewController.h"
#import "ZZCArticlesDetailViewController.h"
@interface ZZCHomeViewController ()<MJRefreshBaseViewDelegate>
@property (nonatomic, strong) MJRefreshHeaderView *leftHeadView;
@property (nonatomic, strong) MJRefreshFooterView *leftFootView;
@property (nonatomic, strong) MJRefreshHeaderView *rightHeadView;
@property (nonatomic, strong) MJRefreshFooterView *rightFootView;
@property (nonatomic) int leftPageIndex;
@property (nonatomic) int rightPageIndex;

@property (nonatomic) BOOL isDown;
@end

@implementation ZZCHomeViewController
{
    NSMutableArray *_homeTripsData;
    NSMutableArray *_homeTripsDetailData;
    NSMutableArray *_homeArticlesData;
}
#pragma mark - ================= 各初始化方法 =================

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.leftPageIndex = 1;
        self.rightPageIndex = 1;
    }
    return self;
}
- (void)createData
{
    _homeTripsData = [[NSMutableArray alloc]init];
    _homeTripsDetailData = [[NSMutableArray alloc]init];
    _homeArticlesData = [[NSMutableArray alloc]init];
}
#pragma mark - ================= 界面触发方法 =================
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"蝉游记";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self creatBarButtonItem];
    [self createData];

    [self startHomeTripsRequest];
    [self startHomeArticlesRequest];

    self.leftHeadView = [[MJRefreshHeaderView alloc]initWithScrollView:_leftCollectionView];
    self.leftFootView = [[MJRefreshFooterView alloc]initWithScrollView:_leftCollectionView];

    self.rightHeadView = [[MJRefreshHeaderView alloc]initWithScrollView:_rightCollectionView];
    self.rightFootView = [[MJRefreshFooterView alloc]initWithScrollView:_rightCollectionView];
    
    self.leftHeadView.delegate = self;
    self.leftFootView.delegate = self;
    
    self.rightHeadView.delegate = self;
    self.rightFootView.delegate = self;
}
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - ================= 列表请求方法 =================
//首页 游记列表 请求
- (void)startHomeTripsRequest
{
    NSString * url = [NSString stringWithFormat:TripsFeatured,_leftPageIndex];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *homeTripsArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *tripsDic in homeTripsArr)
        {
            ZZCHomeTripsModel *homeTripsModel = [[ZZCHomeTripsModel alloc]init];
            [homeTripsModel setValuesForKeysWithDictionary:tripsDic];
            
            [_homeTripsData addObject:homeTripsModel];
            [_leftCollectionView reloadData];

        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
//首页 专题列表 请求
- (void)startHomeArticlesRequest
{
    NSString * url = [NSString stringWithFormat:Articles,_rightPageIndex];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *homeArticlesArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *articlesDic in homeArticlesArr)
        {
            ZZCHomeArticlesModel *articlesModel = [[ZZCHomeArticlesModel alloc]init];
            [articlesModel setValuesForKeysWithDictionary:articlesDic];
            
            [_homeArticlesData addObject:articlesModel];
            [_rightCollectionView reloadData];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

#pragma mark - ================= 重写方法 设置item个数=================
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 10)
    {
        return _homeTripsData.count;
    }
    else if (collectionView.tag == 11)
    {
        return _homeArticlesData.count;
    }
    else
        return 0;
}
#pragma mark - ================= 重写方法 注册Cell =================
- (void)registerCellWithUICollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 10)
    {
        [collectionView registerClass:[ZZCHomeTripsCell class] forCellWithReuseIdentifier:@"LB_cell"];
    }
    else if (collectionView.tag == 11)
    {
        [collectionView registerClass:[ZZCHomeArticlesCell class] forCellWithReuseIdentifier:@"RB_cell"];
    }
}
#pragma mark - ================= 重写 加载数据 方法=================

- (void)updateTabViewCell:(UICollectionViewCell *)cell collectionView:(UICollectionView *)collectionView indexpath:(NSIndexPath *)indexpath
{
    if (_homeTripsData.count && collectionView.tag == 10)
    {
        ZZCHomeTripsCell *homeTripsCell = (ZZCHomeTripsCell *)cell;
        ZZCHomeTripsModel *homeTripsModel = _homeTripsData[indexpath.row];
        
        [homeTripsCell.frontCoverImageView sd_setImageWithURL:[NSURL URLWithString:homeTripsModel.front_cover_photo_url]];
        homeTripsCell.nameLabel.text = homeTripsModel.name;
        
        homeTripsCell.otherLabel.text = [NSString stringWithFormat:@"%@ / %@天,%@图",homeTripsModel.start_date,homeTripsModel.days,homeTripsModel.photos_count];
        
        homeTripsCell.userImageView.layer.cornerRadius = 20.0f;
        homeTripsCell.userImageView.layer.borderWidth = 2.0;
        homeTripsCell.userImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        homeTripsCell.userImageView.clipsToBounds = YES;
        
        [homeTripsCell.userImageView sd_setImageWithURL:[NSURL URLWithString:homeTripsModel.user.image] placeholderImage:[UIImage imageNamed:@"TripUserAvatarPlaceholder"]];
    }
    else if (_homeArticlesData.count && collectionView.tag == 11)
    {
        ZZCHomeArticlesCell *homeArticlesCell = (ZZCHomeArticlesCell *)cell;
        ZZCHomeArticlesModel *homeArticlesModel = _homeArticlesData[indexpath.row];
        
        homeArticlesCell.nameLabel.text =homeArticlesModel.name;
        
        homeArticlesCell.subTitleLabel.text = homeArticlesModel.title;
        
        [homeArticlesCell.frontCoverImageView sd_setImageWithURL:[NSURL URLWithString:homeArticlesModel.image_url]];
    }

}
#pragma mark - ================= 跳转 详情 界面=================

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 10)
    {
        
        ZZCHomeTripsModel *T= _homeTripsData[indexPath.row];
        NSLog(@"L");
        NSLog(@"%@",T.idNum);
        
        ZZCTripsDetailViewController *TripsDetail = [[ZZCTripsDetailViewController alloc]init];
        TripsDetail.requestId = T.idNum;
        [self.navigationController pushViewController:TripsDetail animated:YES];
        
    }
    if (collectionView.tag == 11)
    {
        ZZCHomeArticlesModel *R = _homeArticlesData[indexPath.row];
        NSLog(@"R");
        NSLog(@"%@",R.idNum);
        ZZCArticlesDetailViewController *ArticlesDetail = [[ZZCArticlesDetailViewController alloc]init];
        ArticlesDetail.requestId = R.idNum;
        ArticlesDetail.headImageUrl = R.image_url;
        [self.navigationController pushViewController:ArticlesDetail animated:YES];
    }
}

#pragma mark - ================= 上下拉刷新 =================
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    
    if (refreshView == self.leftHeadView)
    {
        self.isDown = YES;
        [_homeTripsData removeAllObjects];
        self.leftPageIndex = 1;
        [self startHomeTripsRequest];
    }
    if (refreshView == self.leftFootView)
    {
        self.isDown = NO;
        self.leftPageIndex += 1;
        [self startHomeTripsRequest];
    }
    
    if (refreshView == self.rightHeadView)
    {
        self.isDown = YES;
        [_homeArticlesData removeAllObjects];
        self.rightPageIndex = 1;
        [self startHomeArticlesRequest];
    }
    if (refreshView == self.rightFootView)
    {
        self.isDown = NO;
        self.rightPageIndex += 1;
        [self startHomeArticlesRequest];
    }

    
    [refreshView performSelector:@selector(endRefreshing) withObject:nil afterDelay:0.25f];
}

#pragma mark - ================= 创建首页导航栏左右键 =================
- (void)creatBarButtonItem
{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"SettingBarButton"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 22, 22);
    leftBtn.tag = 1;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"SearchBarButton"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 2;
    rightBtn.frame = CGRectMake(0, 0, 22, 22);
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

- (void)btnClick:(UIButton *)sender
{
    NSLog(@"BtnClick!");
}

@end
