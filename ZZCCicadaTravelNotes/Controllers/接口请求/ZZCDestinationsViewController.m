//
//  ZZCDestinationsViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDestinationsViewController.h"//Destinations
#import "ZZCAddress.h"
#import "AFNetworking.h"
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
@interface ZZCDestinationsViewController ()
@end

@implementation ZZCDestinationsViewController
{
    NSMutableArray *_destinationsData;                  //目的地 列表
    NSMutableArray *_destinationsDetailData;            //目的地详情 列表
    NSMutableArray *_destinationsArticlesData;       //目的专题地 列表
    NSMutableArray *_destinationsPlansData;             //目的行程列表
    NSMutableArray *_destinationsPlansDetailData;       //目的行程详情
    NSMutableArray *_destinationsPlansAttractionsData;  //目的行程站点
    NSMutableArray *_destinationsAttractionsData;       //目的地旅行地 列表
    NSMutableArray *_destinationsTripsData;       //目的地游记 列表
    
    NSMutableArray *_destinationsPlansAttractionsPhotoData;       //目的地行程站点 图片
    NSMutableArray *_destinationsPlansAttractionsTripsData;       //目的地行程站点 游记
    NSMutableArray *_destinationsPlansAttractionsNearbyPoisData;        //目的地行程站点 地图

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
    _destinationsDetailData = [[NSMutableArray alloc]init];
    _destinationsArticlesData = [[NSMutableArray alloc]init];
    _destinationsPlansData = [[NSMutableArray alloc]init];
    _destinationsPlansDetailData = [[NSMutableArray alloc]init];
    _destinationsPlansAttractionsData = [[NSMutableArray alloc]init];
    _destinationsAttractionsData = [[NSMutableArray alloc]init];
    _destinationsTripsData = [[NSMutableArray alloc]init];
    
    _destinationsPlansAttractionsPhotoData = [[NSMutableArray alloc]init];
    _destinationsPlansAttractionsTripsData = [[NSMutableArray alloc]init];
    _destinationsPlansAttractionsNearbyPoisData = [[NSMutableArray alloc]init];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startDestinationsRequest];          //目的地列表 请求
//    [self startDestinationsDetailRequest];    //目的地详情 列表 请求
    
//    [self startDestinationsArticlesRequest]; //目的地 专题列表 请求
//    [self startDestinationsPlansRequest];         //目的地 行程列表 请求
//    [self startDestinationsPlansDetailRequest];   //目的地 行程详情 请求
//    [self startDestinationsPlansAttractionsRequest]; //目的地 行程站点（旅行地） 请求
//    [self startDestinationsAttractionsRequest]; //目的地 旅行地列表 请求
//    [self startDestinationsTripsRequest]; //目的地 游记列表 请求
    
//    [self startDestinationsPlansAttractionsTripsRequest]; //目的地行程站点 游记 请求
//    [self startDestinationsPlansAttractionsPhotoRequest]; //目的地行程站点 图片 请求
    [self startDestinationsPlansAttractionsNearbyPoisRequest]; //目的地行程站点 地图 请求
    [self createData];

}
//目的地行程站点 地图 请求
- (void)startDestinationsPlansAttractionsNearbyPoisRequest
{
    NSString *url = [NSString stringWithFormat:NearbyPois,156560];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * attractionsNearbyPoisArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *attractionsNearbyPoisDic in attractionsNearbyPoisArr)
        {
            ZZCAttractionsNearbyPoisModel *attractionsNearbyPoisModel = [[ZZCAttractionsNearbyPoisModel alloc]init];
            [attractionsNearbyPoisModel setValuesForKeysWithDictionary:attractionsNearbyPoisDic];
            
            [_destinationsPlansAttractionsNearbyPoisData addObject:attractionsNearbyPoisModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地行程站点 图片 请求
- (void)startDestinationsPlansAttractionsPhotoRequest
{
    NSString *url = [NSString stringWithFormat:AttractionsPhotos,35443,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * attractionsPhotoArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *attractionsPhotoDic in attractionsPhotoArr)
        {
             ZZCAttractionsPhotosModel *attractionsPhotosModel = [[ZZCAttractionsPhotosModel alloc]init];
            [attractionsPhotosModel setValuesForKeysWithDictionary:attractionsPhotoDic];
            
            [_destinationsPlansAttractionsPhotoData addObject:attractionsPhotosModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地行程站点 游记 请求
- (void)startDestinationsPlansAttractionsTripsRequest
{
    NSString *url = [NSString stringWithFormat:AttractionTrips,35443,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *destinationsPlansAttractionsTripsDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCAttractionTripTags *destinationsPlansAttractionsTripsModel = [[ZZCAttractionTripTags alloc]init];
        [destinationsPlansAttractionsTripsModel setValuesForKeysWithDictionary:destinationsPlansAttractionsTripsDic];
        
        [_destinationsPlansAttractionsTripsData addObject:destinationsPlansAttractionsTripsModel];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地 专题列表 请求
- (void)startDestinationsArticlesRequest
{
    NSString *url = [NSString stringWithFormat:ArticlesWithDestinationsID,55,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsArticlesArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsArticlesDic in destinationsArticlesArr)
        {
            ZZCDestinationsArticlesModel *destinationsArticlesModel = [[ZZCDestinationsArticlesModel alloc]init];
            
            [destinationsArticlesModel setValuesForKeysWithDictionary:destinationsArticlesDic];
            
            [_destinationsArticlesData addObject:destinationsArticlesModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地 游记列表 请求
- (void)startDestinationsTripsRequest
{
    NSString *url = [NSString stringWithFormat:TripsWithDestinationsID,55,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsTripsArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsTripsDic in destinationsTripsArr)
        {
            ZZCDestinationsTripsModel *destinationsTripsModel = [[ZZCDestinationsTripsModel alloc]init];
            
            [destinationsTripsModel setValuesForKeysWithDictionary:destinationsTripsDic];
            
            [_destinationsTripsData addObject:destinationsTripsModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
//目的地 旅行地列表 请求
- (void)startDestinationsAttractionsRequest
{
    NSString *url = [NSString stringWithFormat:AttractionsWithDestinationsID,55,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsAttractionsArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsAttractionsDic in destinationsAttractionsArr)
        {
            ZZCDestinationsAttractionsModel *destinationsAttractionsModel = [[ZZCDestinationsAttractionsModel alloc]init];
            
            [destinationsAttractionsModel setValuesForKeysWithDictionary:destinationsAttractionsDic];
            
            [_destinationsPlansAttractionsData addObject:destinationsAttractionsModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地 行程站点(旅行地)详情 请求
- (void)startDestinationsPlansAttractionsRequest
{
    NSString *url = [NSString stringWithFormat:AttractionsWithID,156560];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *destinationsPlansAttractionsDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCAttractionsModel *attractionsModel = [[ZZCAttractionsModel alloc]init];
        
        [attractionsModel setValuesForKeysWithDictionary:destinationsPlansAttractionsDic];
        
        [_destinationsPlansAttractionsData addObject:attractionsModel];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地 行程详情 请求
- (void)startDestinationsPlansDetailRequest
{
    NSString *url = [NSString stringWithFormat:PlansWithID,1693];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *destinationsPlansDetailDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCDestinationsPlansDetailModel *destinationsPlansDetailModel = [[ZZCDestinationsPlansDetailModel alloc]init];
        
        [destinationsPlansDetailModel setValuesForKeysWithDictionary:destinationsPlansDetailDic];
        
        [_destinationsPlansDetailData addObject:destinationsPlansDetailModel];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地 行程列表 请求
- (void)startDestinationsPlansRequest
{
    NSString *url = [NSString stringWithFormat:PlansWithDestinationsID,55,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsPlansArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *destinationsPlansDic in destinationsPlansArr)
        {
            ZZCDestinationsPlansModel *destinationsPlansModel = [[ZZCDestinationsPlansModel alloc]init];
            [destinationsPlansModel setValuesForKeysWithDictionary:destinationsPlansDic];
            
            [_destinationsPlansData addObject:destinationsPlansModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

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

//            ZZCDestinationsModel *m = destinationsCategoryModel.destinations[0];
//            NSLog(@"%@",m.idNum);
            
            [_destinationsData addObject:destinationsCategoryModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//目的地详情 列表 请求
- (void)startDestinationsDetailRequest
{
    NSString * url = [NSString stringWithFormat:DestinationsWithID,55];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsDetailArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsDetailDic in destinationsDetailArr)
        {
            ZZCDestinationsDetailModel *destinationsDetailModel = [[ZZCDestinationsDetailModel alloc]init];
            [destinationsDetailModel setValuesForKeysWithDictionary:destinationsDetailDic];
            [_destinationsDetailData addObject:destinationsDetailModel];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
