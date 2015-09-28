//
//  ZZCTabBarView.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZCTabBarView;

@protocol ZZCTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZZCTabBarView *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface ZZCTabBarView : UIView
@property (nonatomic,weak) id<ZZCTabBarDelegate> delegate;
- (void) addTabBarButtonWithItem:(UITabBarItem *)item;

@end
