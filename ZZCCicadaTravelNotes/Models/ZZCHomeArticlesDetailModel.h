//
//  ZZCHomeArticlesDetailModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCHomeArticlesDetailModel : NSObject
@property (nonatomic,copy) NSString *idNum; // 113,
@property (nonatomic,copy) NSString *name; // 关你“猫”事~,
@property (nonatomic,copy) NSString *image_url; // http; ////m.chanyouji.cn/articles/113.jpg,
@property (nonatomic,copy) NSString *title; // 我们鼓浪屿喵星人要统治世界,
@property (nonatomic,copy) NSString *comments_count; // 0,
@property (nonatomic,copy) NSString *destination_id; // 161,
@property (nonatomic,copy) NSString *commentable; // false,
@property (nonatomic,copy) NSString *current_user_favorite; // false,
@property (nonatomic,copy) NSString *updated_at; // 1427545307,

@property (nonatomic,copy) NSMutableArray *article_sections; ////shuzu
@end
