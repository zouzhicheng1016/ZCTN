//
//  ZZCSearchViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCSearchViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCSearchListModel.h"
#import "ZZCSearchTripsWithMonth.h"
#import "ZZCDestinationsTripsModel.h"
#import "ZZCDestinationsAttractionsModel.h"
#import "ZZCSearchUsersWithSearchContents.h"
@interface ZZCSearchViewController ()

@end

@implementation ZZCSearchViewController
{
    NSMutableArray *_searchListData; //搜索 列表
    NSMutableArray *_searchTripsWithMonthData; //搜索 列表
    
    NSMutableArray *_searchTripsResultData; //搜索游记结果 列表
    NSMutableArray *_searchDestinationsResultData; //搜索旅行地结果 列表
    NSMutableArray *_searchUsersResultData; //搜索用户结果 列表

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
    [self createData];
//    [self startSearchListRequest];
//    [self startSearchTripsWithMonthRequest];
    [self startSearchTripsWithSearchContentsRequest];
    [self startSearchAttractionsWithSearchContentsRequest];
    [self startSearchUsersWithSearchContentsRequest];

}

- (void)createData
{
    _searchListData = [[NSMutableArray alloc]init]; //搜索 列表
    _searchTripsWithMonthData = [[NSMutableArray alloc]init]; //搜索月份 列表
    
    _searchTripsResultData = [[NSMutableArray alloc]init]; //搜索游记结果 列表
    _searchDestinationsResultData = [[NSMutableArray alloc]init]; //搜索旅行地结果 列表
    _searchUsersResultData = [[NSMutableArray alloc]init]; //搜索用户结果 列表
}
//搜索用户结果 列表
- (void)startSearchUsersWithSearchContentsRequest
{
    //?page=1&q=湖北
    NSString *url = [NSString stringWithFormat:SearchUsersWithSearchContents];
    NSLog(@"%@",url);
    NSDictionary *parameter=@{@"page": @"1",@"q": @"祭奠na些",};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *searchUsersResultArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *searchUsersResultDic in searchUsersResultArr)
        {
            ZZCSearchUsersWithSearchContents *searchUsersResult = [[ZZCSearchUsersWithSearchContents alloc]init];
            [searchUsersResult setValuesForKeysWithDictionary:searchUsersResultDic];
            
            [_searchUsersResultData addObject:searchUsersResult];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//搜索旅行地结果 列表
- (void)startSearchAttractionsWithSearchContentsRequest
{
    //?page=1&q=湖北
    NSString *url = [NSString stringWithFormat:SearchAttractionsWithSearchContents];
    NSLog(@"%@",url);
    NSDictionary *parameter=@{@"page": @"1",@"q": @"湖北",};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *searchDestinationsResultArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *searchDestinationsResultDic in searchDestinationsResultArr)
        {
            ZZCDestinationsAttractionsModel *searchAttractionsResult = [[ZZCDestinationsAttractionsModel alloc]init];
            [searchAttractionsResult setValuesForKeysWithDictionary:searchDestinationsResultDic];
            
            [_searchDestinationsResultData addObject:searchAttractionsResult];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
//搜索游记结果 列表
- (void)startSearchTripsWithSearchContentsRequest
{
    //?page=1&q=湖北
    NSString *url = [NSString stringWithFormat:SearchTripsWithSearchContents];
    NSLog(@"%@",url);
    NSDictionary *parameter=@{@"page": @"1",@"q": @"湖北",};

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *searchTripsResultArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *searchTripsResultDic in searchTripsResultArr)
        {
            ZZCDestinationsTripsModel *searchTripsResult = [[ZZCDestinationsTripsModel alloc]init];
            [searchTripsResult setValuesForKeysWithDictionary:searchTripsResultDic];
            
            [_searchTripsResultData addObject:searchTripsResult];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//搜索四季列表 请求
- (void)startSearchTripsWithMonthRequest
{
    NSString *url = [NSString stringWithFormat:TripsWithMonth,2,1];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *searchTripsWithMonthArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *searchTripsWithMonthDic in searchTripsWithMonthArr)
        {
            ZZCSearchTripsWithMonth *searchTripsWithMonth = [[ZZCSearchTripsWithMonth alloc]init];
            [searchTripsWithMonth setValuesForKeysWithDictionary:searchTripsWithMonthDic];
            
            [_searchTripsWithMonthData addObject:searchTripsWithMonth];

        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

//搜索国内/国外 列表 请求
- (void)startSearchListRequest
{
    NSString *url = [NSString stringWithFormat:SearchList];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *searchListDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        ZZCSearchListModel *searchListModel = [[ZZCSearchListModel alloc]init];
        [searchListModel setValuesForKeysWithDictionary:searchListDic];
        
        [_searchListData addObject:searchListModel];
        
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
