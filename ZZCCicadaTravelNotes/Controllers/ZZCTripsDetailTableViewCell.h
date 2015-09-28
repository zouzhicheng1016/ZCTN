//
//  ZZCTripsDetailTableViewCell.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "ZZCNotes.h"

@interface ZZCTripsDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *entryView;
@property (strong, nonatomic) IBOutlet UIImageView *entryIconImageView;
@property (strong, nonatomic) IBOutlet UILabel *entryNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *memoLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *descriptionsLabel;
@property (strong, nonatomic) IBOutlet UIButton *destinationBtn;
- (IBAction)destinationBtnClick:(id)sender;
- (void)fillCellWithMode:(ZZCNotes *)mode entryView:(CGFloat)entryH commnent :(CGFloat)commentH photo:(CGFloat)photoH descriptions:(CGFloat)descriptionsH;
@end
