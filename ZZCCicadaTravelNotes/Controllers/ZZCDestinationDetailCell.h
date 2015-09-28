//
//  ZZCDestinationDetailCell.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZCDestinationDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name_cnLabel;
@property (strong, nonatomic) IBOutlet UILabel *name_enLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
- (IBAction)destinationArticlesBtn:(UIButton *)sender;

- (IBAction)destinationPlansBtn:(UIButton *)sender;

- (IBAction)destinationAttractionsBtn:(UIButton *)sender;

- (IBAction)destinationTripsBtn:(UIButton *)sender;

- (IBAction)destinationsDownloadBtn:(UIButton *)sender;
@end
