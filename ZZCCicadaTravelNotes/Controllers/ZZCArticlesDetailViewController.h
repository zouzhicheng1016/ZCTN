//
//  ZZCArticlesDetailViewController.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFStretchableTableHeaderView.h"

@interface ZZCArticlesDetailViewController : UIViewController
@property (nonatomic,copy) NSString *requestId;
@property (nonatomic,copy) NSString *headImageUrl;

@property (nonatomic, strong) IBOutlet UIImageView* stretchView;
@property (nonatomic, strong) HFStretchableTableHeaderView* stretchableTableHeaderView;
@end
