//
//  ZZCMyTravelViewController.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZCMyTravelViewController : UIViewController
- (IBAction)WeiboLoginBtn:(UIButton *)sender;
- (IBAction)QQLoginBtn:(UIButton *)sender;
- (IBAction)registerBtn:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end
