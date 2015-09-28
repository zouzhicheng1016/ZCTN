//
//  ZZCMyTravelViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCMyTravelViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCMyInfoModel.h"
#import "ZZCRegisterViewController.h"
#import "ZZCMyInfoModel.h"
#import "ZZCMyInfoViewController.h"

#import "UMSocial.h"

@interface ZZCMyTravelViewController ()<UITextFieldDelegate,UMSocialUIDelegate>

@end

@implementation ZZCMyTravelViewController
{
    ZZCMyInfoViewController *_myInfoVc;
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
    self.navigationItem.title = @"我的旅行";
    
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
}

//登录请求
-(void)startLoginRequest
{
    NSString *url = Login;
    NSDictionary *parameters = @{@"email":self.accountTextField.text,@"password":self.passwordTextField.text};

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *myInfoDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        ZZCMyInfoModel *myInfoModel = [[ZZCMyInfoModel alloc]init];
        [myInfoModel setValuesForKeysWithDictionary:myInfoDic];
        
        _myInfoVc = [[ZZCMyInfoViewController alloc]init];
        _myInfoVc.myInfo = myInfoModel;
        
        NSString *myName = myInfoModel.name;
        
        NSLog(@"%@ 登录成功!",myName);
        
        [self.navigationController pushViewController:_myInfoVc animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"登录失败!");
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 102)
    {
        [self startLoginRequest];
    }
    
    return YES;
}

//点击调用第三方登录
- (IBAction)WeiboLoginBtn:(UIButton *)sender
{
    //此处调用授权的方法,你可以把下面的platformName 替换成 UMShareToSina,UMShareToTencent等
    NSString *platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeSina];
    
    [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:platformName];
    // 授权及获取用户信息，
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //          获取微博用户名、uid、token等
        if (response.responseCode == UMSResponseCodeSuccess) {
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:platformName];
            
            NSLog(@"username is %@, uid is %@, token is %@ iconUrl is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//             创建表
//                        [[FMDBManager sharedInstace] creatTable:weiboUser];
//             调用插入或更新语句
//                        [[FMDBManager sharedInstace] insertAndUpdateModelToDatabase:weiboUser];
//            
//             删除对应的实体数据
//                        [[FMDBManager sharedInstace] deleteModelInDatabase:weiboUser];
        }
        
        //这里可以获取到腾讯微博openid,Qzone的token等
        /*
         if ([platformName isEqualToString:UMShareToTencent]) {
         [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToTencent completion:^(UMSocialResponseEntity *respose){
         NSLog(@"get openid  response is %@",respose);
         }];
         }
         */
        
    });
}

- (IBAction)QQLoginBtn:(UIButton *)sender
{
    
}

- (IBAction)registerBtn:(UIButton *)sender
{
    ZZCRegisterViewController *registerAcc = [[ZZCRegisterViewController alloc]init];
    
    [self.navigationController pushViewController:registerAcc animated:YES];
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
