//
//  ZZCHomeArticlesCell.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZCHomeArticlesModel.h"
@interface ZZCHomeArticlesCell : UITableViewCell
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) UIImageView *frontCoverImageView;

-(void)refreshData:(ZZCHomeArticlesModel *)homeArticlesModel;
@end
