//
//  ZZCBaseViewController.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYSegmentedControl.h"
#import "ZZCBaseView.h"
#import "ZZCHomeTripsCell.h"
#import "ZZCHomeArticlesCell.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"

@interface ZZCBaseViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_leftCollectionView;

    UICollectionView *_rightCollectionView;
    
    ZZCBaseView *_contentView;
    
    BOOL _isChange;
}
@property (nonatomic,strong)NYSegmentedControl *SegmentedControl;
//@property (nonatomic,strong)ZZCBaseView *contentView;
- (void)SegClick;
- (void)createContentView;
- (void)createList;


- (void)updateTabViewCell:(UICollectionViewCell *)cell collectionView:(UICollectionView *)collectionView indexpath:(NSIndexPath *)indexpath;

- (void)registerCellWithUICollectionView:(UICollectionView *)collectionView;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end
