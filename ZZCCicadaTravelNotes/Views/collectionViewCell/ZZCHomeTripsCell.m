//
//  ZZCHomeTripsCell.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeTripsCell.h"

@implementation ZZCHomeTripsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.frontCoverImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
        [self.contentView addSubview:self.frontCoverImageView];
        
        self.userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 150, 40, 40)];
        [self.contentView addSubview:self.userImageView];

        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 18)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:nil size:20.0f];
        [self.contentView addSubview:self.nameLabel];
        
        self.otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 33, 280, 14)];
        self.otherLabel.textColor = [UIColor whiteColor];
        self.otherLabel.font = [UIFont fontWithName:nil size:14.0f];
        [self.contentView addSubview:self.otherLabel];
    
    }
    return self;
}

@end
