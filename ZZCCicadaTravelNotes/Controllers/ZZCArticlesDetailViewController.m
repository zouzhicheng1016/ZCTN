//
//  ZZCArticlesDetailViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCArticlesDetailViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCHomeArticlesDetailModel.h"
#import "ZZCArticlesections.h"
#import "UIImageView+WebCache.h"
#import "ZZCArticlesDetailTableViewCell.h"

#import "UIScrollView+APParallaxHeader.h"

@interface ZZCArticlesDetailViewController ()<UITableViewDataSource,UITableViewDelegate,APParallaxViewDelegate>
@property (nonatomic,strong)UITableView *articlesTableView;

@end

@implementation ZZCArticlesDetailViewController
{
    NSMutableArray *_homeArticlesDetailData;
    
    CGFloat _titleH;
    CGFloat _descriptionH;
    CGFloat _photoH;
    
    NSNumber *_titleHeight;
    NSNumber *_descriptionHeight;
    NSNumber *_photoImageViewHeight;

    NSMutableArray *_titleHeightArray;
    NSMutableArray *_photoHeightArray;
    NSMutableArray *_descriptionHeightArray;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
//    self.navigationController.navigationBar.alpha = 0;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [self createTableView];

   
    UIImageView *headView = [[UIImageView alloc]init];

    [headView sd_setImageWithURL:[NSURL URLWithString:self.headImageUrl] placeholderImage:[UIImage imageNamed:@"headImage"]];
//    [self.articlesTableView addParallaxWithView:headView andHeight:200];
    
    [self.articlesTableView addParallaxWithImage:headView.image andHeight:160 andShadow:YES];

    self.articlesTableView.parallaxView.delegate = self;

    [self createData];
    [self startArticlesDetailRequest];
   
    
    [_articlesTableView registerNib:[UINib nibWithNibName:@"ZZCArticlesDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

}
- (void)createData
{
    _homeArticlesDetailData = [[NSMutableArray alloc]init];
    _titleHeightArray = [[NSMutableArray alloc]init];;
    _descriptionHeightArray = [[NSMutableArray alloc]init];;
    _photoHeightArray = [[NSMutableArray alloc]init];
}
//首页 专题详情 请求
- (void)startArticlesDetailRequest
{
    NSString * url = [NSString stringWithFormat:ArticlesWithID,_requestId];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *articlesDetailDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCHomeArticlesDetailModel *articlesDetailModel = [[ZZCHomeArticlesDetailModel alloc]init];
        [articlesDetailModel setValuesForKeysWithDictionary:articlesDetailDic];
        
        [_homeArticlesDetailData addObject:articlesDetailModel];
        [_articlesTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
- (void)createTableView
{
    _articlesTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568 - 20) style:UITableViewStylePlain];
    //解决 tableView 分割线 左边短了一截的问题
    if ([_articlesTableView respondsToSelector:@selector(setSeparatorInset:)]) //ios7
    {
        [_articlesTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_articlesTableView respondsToSelector:@selector(setLayoutMargins:)]) //ios8
    {
        [_articlesTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    [_articlesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    _articlesTableView.delegate = self;
    _articlesTableView.dataSource = self;
    [self.view addSubview:_articlesTableView];
}

//解决 tableView 分割线 左边短了一截的问题
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_articlesTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_homeArticlesDetailData.count)
    {
        ZZCHomeArticlesDetailModel *articlesDetail = _homeArticlesDetailData[0];
        ZZCArticlesections *articleSections = articlesDetail.article_sections[indexPath.row];
//计算标题的高度
        if (articleSections.title.length == 0)
        {
            _titleH = 0;
        }
        else
        {
            _titleH = [articleSections.title boundingRectWithSize:CGSizeMake(300, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size.height;
        }
        _titleHeight = [NSNumber numberWithFloat:_titleH];//转成 对象存到数组中
        [_titleHeightArray addObject:_titleHeight];
        
//计算描述的高度
        _descriptionH = [articleSections.descriptions boundingRectWithSize:CGSizeMake(300, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height + 14;
        _descriptionHeight = [NSNumber numberWithFloat:_descriptionH];
        [_descriptionHeightArray addObject:_descriptionHeight];
        
        
        if ([articleSections.image_width floatValue] == 0)
        {
            _photoH = 0;
        }
        else
        {
            _photoH = [articleSections.image_height floatValue] * 320 / [articleSections.image_width floatValue];
        }
        
//计算照片的高度
        _photoImageViewHeight = [NSNumber numberWithFloat:_photoH];
        [_photoHeightArray addObject:_photoImageViewHeight];

//计算cell的总高度
        CGFloat cellHeight = _titleH + _descriptionH + _photoH + 20;
        return cellHeight;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 200;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIImageView *headView = [[UIImageView alloc]init];
//    if (section == 0)
//    {
//        headView.frame = CGRectMake(0, 0, 320, 200);
//        [headView sd_setImageWithURL:[NSURL URLWithString:self.headImageUrl] placeholderImage:[UIImage imageNamed:@"headImage"]];
//    }
//    return (UIView *)headView;
// 
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_homeArticlesDetailData.count)
    {
        ZZCHomeArticlesDetailModel *articlesDetail = _homeArticlesDetailData[0];
        
        return articlesDetail.article_sections.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZCArticlesDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (_homeArticlesDetailData.count)
    {
        ZZCHomeArticlesDetailModel *articlesDetail = _homeArticlesDetailData[0];
        ZZCArticlesections *articleSections = articlesDetail.article_sections[indexPath.row];
        
        [cell fillCellWithModel:articleSections titleH:[_titleHeightArray[indexPath.row] floatValue] descriptionH:[_descriptionHeightArray[indexPath.row] floatValue] photoH:[_photoHeightArray[indexPath.row] floatValue]];
//    [cell fillCellWithModel:articleSections titleFrame:_titleHeightArray[indexPath.row] descriptionFrame:_descriptionFrame imageSize:_photoImageViewSize];
        
        return cell;
    }
    
    return cell;
}

#pragma mark - APParallaxViewDelegate

- (void)parallaxView:(APParallaxView *)view willChangeFrame:(CGRect)frame
{
    // Do whatever you need to do to the parallaxView or your subview before its frame changes
    NSLog(@"parallaxView:willChangeFrame: %@", NSStringFromCGRect(frame));
}

- (void)parallaxView:(APParallaxView *)view didChangeFrame:(CGRect)frame
{
    // Do whatever you need to do to the parallaxView or your subview after its frame changed
    NSLog(@"parallaxView:didChangeFrame: %@", NSStringFromCGRect(frame));
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
//    UILabel *label = [[UILabel alloc]initWithFrame:headView.bounds];
//    label.text = [NSString stringWithFormat:@"test%d",section];
//    [headView addSubview:label];
//    return headView;
//}

@end
