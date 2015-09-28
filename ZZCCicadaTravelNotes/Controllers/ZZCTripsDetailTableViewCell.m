//
//  ZZCTripsDetailTableViewCell.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCTripsDetailTableViewCell.h"

@implementation ZZCTripsDetailTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)fillCellWithMode:(ZZCNotes *)mode entryView:(CGFloat)entryH commnent :(CGFloat)commentH photo:(CGFloat)photoH descriptions:(CGFloat)descriptionsH
{
    
    [self.entryView setFrame: CGRectMake(10, 0, 300, entryH)];
    if (entryH == 0)
    {
        [self.entryView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.entryView.hidden = YES;
    }

    [self.commentLabel setFrame:CGRectMake(10, CGRectGetMaxY(self.entryView.frame) , 300, commentH)];
    if (commentH == 0)
    {
        self.commentLabel.hidden = YES;
    }

    [self.photoImageView setFrame:CGRectMake(10, CGRectGetMaxY(self.commentLabel.frame) + 10, 300, photoH)];
    if (mode.photo.url.length != 0)
    {
        [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:mode.photo.url]];
    }
//    else
//    {
//        self.photoImageView.image = nil;
//    }
    
    [self.descriptionsLabel setFrame:CGRectMake(10, CGRectGetMaxY(self.photoImageView.frame) + 5, 300, descriptionsH)];
    if (descriptionsH != 0)
    {
        self.descriptionsLabel.text = mode.descriptions;
    }
//    else
//    {
//        self.descriptionsLabel.text = nil;
//        self.descriptionsLabel.hidden = YES;
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)destinationBtnClick:(id)sender {
}

//- (void)prepareForReuse
//{
//    [super prepareForReuse];
//
//}
@end
