//
//  ZZCMyInfoViewController.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZCMyInfoModel.h"
@interface ZZCMyInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *iconimageView;
@property (nonatomic,strong) ZZCMyInfoModel *myInfo;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tripsLabel;
- (IBAction)notificationBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *genderImageView;
@end
