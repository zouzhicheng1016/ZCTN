//
//  ZZCAttractionTripTags.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCAttractionTripTags : NSObject
@property (nonatomic,copy) NSString *idNum;// 2042,
@property (nonatomic,copy) NSString *name;// "关西机场印象",

@property (nonatomic,copy) NSString *display_count;// 99,
                                    //"trips_count": 562
#warning S
@property (nonatomic,copy) NSMutableArray *attraction_contents;
//行程站点 游记 添加的属性                                    //"attraction_trips"
@property (nonatomic,copy) NSMutableArray *attraction_trips;
//
@end
