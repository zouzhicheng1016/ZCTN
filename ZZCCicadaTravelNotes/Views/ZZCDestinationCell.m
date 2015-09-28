//
//  ZZCDestinationCell.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDestinationCell.h"

@implementation ZZCDestinationCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.destinationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 147, 220)];
        [self.contentView addSubview:self.destinationImageView];
        
        self.destinationName_cn = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 127, 18)];
        self.destinationName_cn.textColor = [UIColor whiteColor];
        self.destinationName_cn.font = [UIFont fontWithName:nil size:18.0f];

        [self.contentView addSubview:self.destinationName_cn];

        self.destinationName_en = [[UILabel alloc]initWithFrame:CGRectMake(10, 33, 127, 14)];
        self.destinationName_en.textColor = [UIColor whiteColor];
        self.destinationName_en.font = [UIFont fontWithName:nil size:14.0f];
        [self.contentView addSubview:self.destinationName_en];
        
 
        self.destinationPoi_count = [[UILabel alloc]initWithFrame:CGRectMake(38, 185, 71, 20)];
        self.destinationPoi_count.textColor = [UIColor whiteColor];
        self.destinationPoi_count.font = [UIFont fontWithName:nil size:13.0f];
        self.destinationPoi_count.textAlignment = NSTextAlignmentCenter;
        self.destinationPoi_count.backgroundColor = [UIColor blackColor];
        self.destinationPoi_count.alpha = 0.9;
        [self.contentView addSubview:self.destinationPoi_count];

    }
    return self;
}

@end
