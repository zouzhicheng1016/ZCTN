//
//  ZZCRegisterViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCRegisterViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCMyInfoModel.h"
@interface ZZCRegisterViewController ()

@end

@implementation ZZCRegisterViewController

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
    [self startRegisterRequest];
}

-(void)startRegisterRequest
{
    NSString *url = Register;
    NSDictionary *parameters = @{@"email":self.accountTextField.text,@"password":self.passwordTextField.text};

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


@end
