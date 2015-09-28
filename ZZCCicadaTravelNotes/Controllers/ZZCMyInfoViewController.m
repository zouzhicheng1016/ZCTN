//
//  ZZCMyInfoViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15/4/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCMyInfoViewController.h"
#import "UIImageView+WebCache.h"
@interface ZZCMyInfoViewController ()

@end

@implementation ZZCMyInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.iconimageView sd_setImageWithURL:[NSURL URLWithString:self.myInfo.image]];
    self.nameLabel.text = self.myInfo.name;
    self.tripsLabel.text = [NSString stringWithFormat:@"%@篇游记",self.myInfo.trips_count];
    if ([self.myInfo.gender integerValue] == 1)
    {
        self.genderImageView.image = [UIImage imageNamed:@"male_ipad.png"];
    }
    else
    {
        self.genderImageView.image = [UIImage imageNamed:@"female_ipad"];
    }
    
}


- (IBAction)notificationBtn:(UIButton *)sender
{
    
}
@end
