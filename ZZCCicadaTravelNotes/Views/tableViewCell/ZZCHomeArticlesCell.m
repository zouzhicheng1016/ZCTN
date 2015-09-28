//
//  ZZCHomeArticlesCell.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeArticlesCell.h"

@implementation ZZCHomeArticlesCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.frontCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300,180)];
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
-(void)refreshData:(ZZCHomeArticlesModel *)homeArticlesModel
{
    self.nameLabel.text = homeArticlesModel.name;
    self.subTitleLabel.text = homeArticlesModel.title;
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
