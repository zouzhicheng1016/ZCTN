//
//  ZZCArticlesDetailTableViewCell.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZZCHomeArticlesDetailModel.h"
#import "ZZCArticlesections.h"
#import "ZZCDescriptionUserIds.h"
#import "ZZCnote.h"
#import "UIImageView+WebCache.h"

@interface ZZCArticlesDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
//@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
//@property (strong, nonatomic) IBOutlet UILabel *tripNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
//@property (strong, nonatomic) IBOutlet UIButton *attractionBtn;

- (void)fillCellWithModel:(ZZCArticlesections *)model titleH:(CGFloat)titleH descriptionH:(CGFloat)descriptionH photoH:(CGFloat)photoH;

@end
