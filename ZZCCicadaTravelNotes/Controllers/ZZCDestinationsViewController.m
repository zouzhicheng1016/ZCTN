//
//  ZZCDestinationsViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCDestinationsViewController.h"
#import "ZZCDestinationsCategoryModel.h"
#import "ZZCDestinationsModel.h"
#import "ZZCDestinationsDetailModel.h"
#import "ZZCDestinationContents.h"
#import "ZZCDestinationsArticlesModel.h"
#import "ZZCDestinationsPlansModel.h"
#import "ZZCDestinationsPlansDetailModel.h"
#import "ZZCAttractionsModel.h"
#import "ZZCDestinationsAttractionsModel.h"
#import "ZZCDestinationsTripsModel.h"
#import "ZZCAttractionTripTags.h"
#import "ZZCAttractionsPhotosModel.h"
#import "ZZCAttractionsNearbyPoisModel.h"
#import "ZZCDestinationCell.h"
#import "UIImageView+WebCache.h"
#import "ZZCBaseHeader.h"
#import "ZZCDestinatonDetailViewController.h"
@interface ZZCDestinationsViewController ()

@end

@implementation ZZCDestinationsViewController
{
    NSMutableArray *_destinationsData;                  //目的地 列表

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)createData
{
    _destinationsData = [[NSMutableArray alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"旅行口袋书";
    [self createData];
    [self startDestinationsRequest];          //目的地列表 请求
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = NO;
}

//重写方法 注册 新的Cell
- (void)registerCellWithUICollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 10)
    {
        [collectionView registerClass:[ZZCDestinationCell class] forCellWithReuseIdentifier:@"LB_cell"];
    }
    else if (collectionView.tag == 11)
    {
        [collectionView registerClass:[ZZCDestinationCell class] forCellWithReuseIdentifier:@"RB_cell"];
    }
}

#pragma mark - ================= 触发请求方法 =================
// 目的地列表 请求
- (void)startDestinationsRequest
{
    NSString * url = [NSString stringWithFormat:Destinations];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsCategoryArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsCategoryDic in destinationsCategoryArr)
        {
            ZZCDestinationsCategoryModel *destinationsCategoryModel = [[ZZCDestinationsCategoryModel alloc]init];
            [destinationsCategoryModel setValuesForKeysWithDictionary:destinationsCategoryDic];
            
            [_destinationsData addObject:destinationsCategoryModel];

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

#pragma mark - ================= 设置 Header和Footer 的size =================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(300 , 25);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(300 , 5);
}

#pragma mark - ================= 设置 Header和Footer 的数据 =================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 10)
    {
        return 3;
    }
    else
    {
        return 2;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 10)
    {
         ZZCBaseHeader*v;
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"L_head" forIndexPath:indexPath];
            if (indexPath.section == 0)
            {
                v.headerLabel.text = @"亚洲";
            }
            if (indexPath.section == 1)
            {
                v.headerLabel.text = @"欧洲";
            }
            if (indexPath.section == 2)
            {
                v.headerLabel.text = @"美洲、大洋洲、非洲、南极洲";
            }
            
        }
        else if([kind isEqualToString:UICollectionElementKindSectionFooter])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"L_foot" forIndexPath:indexPath];
        }
        return v;
    }
    else
    {
        ZZCBaseHeader *v;
        
        if ([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"R_head" forIndexPath:indexPath];
            if (indexPath.section == 0)
            {
                v.headerLabel.text = @"港澳台";
            }
            if (indexPath.section == 1)
            {
                v.headerLabel.text = @"大陆";
            }
        }
        else if([kind isEqualToString:UICollectionElementKindSectionFooter])
        {
            v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"R_foot" forIndexPath:indexPath];
        }
        return v;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (collectionView.tag == 10)
    {
        ZZCDestinationsCategoryModel *destinationsCategoryModel = _destinationsData[section];
        NSLog(@"%lu",(unsigned long)[destinationsCategoryModel.destinations count]);
        return [destinationsCategoryModel.destinations count];
    }
    else if (collectionView.tag == 11)
    {
        ZZCDestinationsCategoryModel *destinationsCategoryModel = _destinationsData[3 + section];
        return [destinationsCategoryModel.destinations count];
    }
    else
    {
        return 0;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(147, 220);
}

#pragma mark - ================= 加载 item 的数据 =================
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%d",indexPath.section);
    NSLog(@"+++++++%d",indexPath.row);
    if (collectionView.tag == 10)
    {
        ZZCHomeTripsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LB_cell" forIndexPath:indexPath];
        
        ZZCDestinationsCategoryModel *destinationsCategoryMode = _destinationsData[indexPath.section];
        
        ZZCDestinationsDetailModel *destinationsDetailModel = destinationsCategoryMode.destinations[indexPath.row];
        
        ZZCDestinationCell *destinationCell = (ZZCDestinationCell *)cell;
        
        destinationCell.destinationName_cn.text = destinationsDetailModel.name_zh_cn;
        destinationCell.destinationName_en.text = destinationsDetailModel.name_en;
        [destinationCell.destinationImageView sd_setImageWithURL:[NSURL URLWithString:destinationsDetailModel.image_url]];
        
        destinationCell.destinationPoi_count.text =[NSString stringWithFormat:@"%@ 旅行地",destinationsDetailModel.poi_count];
        return cell;
    }
    else
    {
        
        ZZCHomeArticlesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RB_cell" forIndexPath:indexPath];
        
        ZZCDestinationsCategoryModel *destinationsCategoryMode = _destinationsData[indexPath.section + 3];
        NSLog(@"%d",indexPath.section + 3);
        ZZCDestinationsDetailModel *destinationsDetailModel = destinationsCategoryMode.destinations[indexPath.row];
        
        ZZCDestinationCell *destinationCell = (ZZCDestinationCell *)cell;
        
        destinationCell.destinationName_cn.text = destinationsDetailModel.name_zh_cn;
        destinationCell.destinationName_en.text = destinationsDetailModel.name_en;
        [destinationCell.destinationImageView sd_setImageWithURL:[NSURL URLWithString:destinationsDetailModel.image_url]];
        destinationCell.destinationPoi_count.text =[NSString stringWithFormat:@"%@ 旅行地",destinationsDetailModel.poi_count];
        
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZZCDestinatonDetailViewController *destinatonDeatail = [[ZZCDestinatonDetailViewController alloc]init];
    

    if (collectionView.tag == 10)
    {

        ZZCDestinationsCategoryModel *destinationsCategoryMode = _destinationsData[indexPath.section];
        
        ZZCDestinationsDetailModel *destinationsDetailModel = destinationsCategoryMode.destinations[indexPath.row];
        NSLog(@"国外");
        NSLog(@"%@",destinationsDetailModel.idNum);
        NSLog(@"%@",destinationsDetailModel.name_zh_cn);
        ZZCDestinatonDetailViewController *destinatonDeatail = [[ZZCDestinatonDetailViewController alloc]init];
        destinatonDeatail.requestId = destinationsDetailModel.idNum;
        [self.navigationController pushViewController:destinatonDeatail animated:YES];
        
    }
    
    else
    {
        
        ZZCDestinationsCategoryModel *destinationsCategoryMode = _destinationsData[indexPath.section + 3];
        ZZCDestinationsDetailModel *destinationsDetailModel = destinationsCategoryMode.destinations[indexPath.row];
        NSLog(@"国内");
        NSLog(@"%@",destinationsDetailModel.idNum);

        NSLog(@"%@",destinationsDetailModel.name_zh_cn);

        destinatonDeatail.requestId = destinationsDetailModel.idNum;
        
        [self.navigationController pushViewController:destinatonDeatail animated:YES];
    }
    
}



@end
