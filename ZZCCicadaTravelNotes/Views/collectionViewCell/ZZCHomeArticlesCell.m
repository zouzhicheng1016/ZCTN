//
//  ZZCHomeArticlesCell.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeArticlesCell.h"

@implementation ZZCHomeArticlesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frontCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300,200)];
        [self.contentView addSubview:self.frontCoverImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 127, 280, 20)];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:nil size:20.0f];
        
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 155, 280, 15)];
        [self.contentView addSubview:self.subTitleLabel];
        self.subTitleLabel.textColor = [UIColor whiteColor];
        self.subTitleLabel.font = [UIFont fontWithName:nil size:15.0f];

    }
    return self;
}

@end
