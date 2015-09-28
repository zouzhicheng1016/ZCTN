//
//  ZZCBaseView.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SendViewBlock)(id);

@interface ZZCBaseView : UIView

@property (nonatomic ,copy)SendViewBlock sendView;
//@property (nonatomic,strong)UITableView *tripsTabView;
//@property (nonatomic,strong)UITableView *articlesTabView;
//@property (nonatomic,strong)NSMutableArray *data;
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
