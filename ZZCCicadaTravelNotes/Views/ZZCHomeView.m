//
//  ZZCHomeView.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeView.h"

@implementation ZZCHomeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatBarButtonItem];
    }
    return self;
}


- (void)creatBarButtonItem
{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"SettingBarButton"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 22, 22);
    leftBtn.tag = 8889;
    _leftBarItem =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"SearchBarButton"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 8888;
    rightBtn.frame = CGRectMake(0, 0, 22, 22);
    _rightBarItem =[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

- (void)btnClick:(UIButton *)sender
{
    if (self.sendView)
    {
        self.sendView(sender);
    }
}

@end
