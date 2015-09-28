//
//  ZZCAttractionContents.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCAttractionContentsTrip.h"
@interface ZZCAttractionContents : NSObject
@property (nonatomic,copy) NSString *idNum; //8621,
#warning ATT√
@property (nonatomic,copy) NSString *descriptions; //#填海造岛# ,
@property (nonatomic,copy) NSString *updated_at; //1389853462,

@property (nonatomic,copy) NSString *node_id; //579347,
@property (nonatomic,copy) NSString *node_comments_count; //0,
//行程站点 游记 添加的属性 
@property (nonatomic,copy) NSString *featured;// true,
@property (nonatomic,copy) NSString *photos_count;// 18,
@property (nonatomic,copy) NSString *comment;// "只是单纯地想重温一下.....  巨多人啊啊啊啊",
//
@property (nonatomic) ZZCAttractionContentsTrip *trip;

#warning S
@property (nonatomic,copy) NSMutableArray *notes;
@end
