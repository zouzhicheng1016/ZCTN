//
//  ZZCHomeViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCHomeTripsModel.h"
#import "ZZCHomeArticlesModel.h"
#import "ZZCHomeTripsDetailModel.h"
#import "ZZCTripDays.h"
#import "ZZCNodes.h"
#import "ZZCMemo.h"
#import "ZZCNotes.h"
#import "ZZCNoteslikesComments.h"
#import "ZZCHomeArticlesDetailModel.h"
#import "ZZCArticlesections.h"

@interface ZZCHomeViewController ()

@end

@implementation ZZCHomeViewController
{
    NSMutableArray *_homeTripsData;
    NSMutableArray *_homeTripsDetailData;
    NSMutableArray *_homeArticlesData;
    NSMutableArray *_homeArticlesDetailData;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    //首页 游记列表 请求
    [self startHomeTripsRequest];
    //首页 游记详情 请求
    [self startTripsDetailRequest];
    
    //首页 专题列表 请求
    [self startHomeArticlesRequest];
    //首页 专题详情 请求
    [self startArticlesDetailRequest];
}
- (void)createData
{
    _homeTripsData = [[NSMutableArray alloc]init];
    _homeTripsDetailData = [[NSMutableArray alloc]init];
    _homeArticlesData = [[NSMutableArray alloc]init];
    _homeArticlesDetailData = [[NSMutableArray alloc]init];
}

//首页 专题详情 请求
- (void)startArticlesDetailRequest
{
    NSString * url = [NSString stringWithFormat:ArticlesWithID,113];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *articlesDetailDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCHomeArticlesDetailModel *articlesDetailModel = [[ZZCHomeArticlesDetailModel alloc]init];
        [articlesDetailModel setValuesForKeysWithDictionary:articlesDetailDic];
        
        [_homeArticlesDetailData addObject:articlesDetailModel];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//首页 游记列表 请求
- (void)startHomeTripsRequest
{
    NSString * url = [NSString stringWithFormat:TripsFeatured,1];
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
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
//首页 专题列表 请求
- (void)startHomeArticlesRequest
{
    NSString * url = [NSString stringWithFormat:Articles,1];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *homeArticlesArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *articlesDic in homeArticlesArr)
        {
            ZZCHomeArticlesModel *articlesModel = [[ZZCHomeArticlesModel alloc]init];
            [articlesModel setValuesForKeysWithDictionary:articlesDic];
            [_homeArticlesData addObject:articlesModel];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//首页 游记详情 请求
- (void)startTripsDetailRequest
{
    NSString * url = [NSString stringWithFormat:TripsWithID,203081];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil
    success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *tripsDetailDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        ZZCHomeTripsDetailModel *tripsDetailModel = [[ZZCHomeTripsDetailModel alloc]init];
        [tripsDetailModel setValuesForKeysWithDictionary:tripsDetailDic];
        
        [_homeTripsDetailData addObject:tripsDetailModel];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
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
