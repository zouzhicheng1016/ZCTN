//
//  ZZCMyTravelViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCMyTravelViewController.h"
#import "AFNetworking.h"
#import "ZZCAddress.h"
#import "ZZCMyInfoModel.h"
@interface ZZCMyTravelViewController ()

@end

@implementation ZZCMyTravelViewController

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
    [self startLoginRequest];
    [self startRegisterRequest];
//    [self startSettingInfoRequest];
}
/*登录：
POST
#define Login @"http://chanyouji.com/api/tokens.json"
email=876516196%40qq.com&password=1016112
注册：
#define Register @"http://chanyouji.com/api/users.json"
email=919826832%40qq.com&name=&password=1016112
设置资料：
#define SettingInfo @"http://chanyouji.com/api/users/505939.json"
user%5Bgender%5D=0&user%5Bname%5D=%E5%A4%9C%E4%B8%B6
*/
#warning ERROR
//设置资料
-(void)startSettingInfoRequest
{
    NSString *url = SettingInfo;
    NSDictionary *parameters = @{@"user%5Bgender%5D":@"0",@"user%5Bname%5D":@"%E5%A4%9C%E4%B8%B6"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager PUT:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *myInfoDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCMyInfoModel *myInfoModel = [[ZZCMyInfoModel alloc]init];
        [myInfoModel setValuesForKeysWithDictionary:myInfoDic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

-(void)startRegisterRequest
{
    NSString *url = Login;
    NSDictionary *parameters = @{@"email":@"876516196@qq.com",@"password":@"1016112"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *myInfoDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCMyInfoModel *myInfoModel = [[ZZCMyInfoModel alloc]init];
        [myInfoModel setValuesForKeysWithDictionary:myInfoDic];
        NSLog(@"注册成功!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"注册失败!");
    }];
}

//登录请求
-(void)startLoginRequest
{
    NSString *url = Login;
    NSDictionary *parameters = @{@"email":@"876516196@qq.com",@"password":@"1016112"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *myInfoDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
        ZZCMyInfoModel *myInfoModel = [[ZZCMyInfoModel alloc]init];
        [myInfoModel setValuesForKeysWithDictionary:myInfoDic];
        NSString *myName = myInfoModel.name;
        NSLog(@"%@ 登录成功!",myName);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"登录失败!");
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
