//
//  ZZCArticlesDetailTableViewCell.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCArticlesDetailTableViewCell.h"

@implementation ZZCArticlesDetailTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)fillCellWithModel:(ZZCArticlesections *)model titleH:(CGFloat)titleH descriptionH:(CGFloat)descriptionH photoH:(CGFloat)photoH;
{
    
    self.titleLabel.frame = CGRectMake(10, 5, 300, titleH);
    if (self.titleLabel.frame.size.height != 0)
    {
        self.titleLabel.text = model.title;
    }
    
    self.photoImageView.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 5 , 300, photoH);
    
    if (self.photoImageView.frame.size.height != 0)
    {
        [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    }
    
    self.descriptionLabel.frame = CGRectMake(10, CGRectGetMaxY(self.photoImageView.frame) + 5, 300, descriptionH);
    self.descriptionLabel.text = model.descriptions;
  
}
@end
