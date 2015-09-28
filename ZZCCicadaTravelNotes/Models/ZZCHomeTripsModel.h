//
//  ZZCHomeTripsModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCTripsUserInfo.h"

#warning SSS
@interface ZZCHomeTripsModel : NSObject
@property (nonatomic,copy) NSString *idNum;// 133093,
@property (nonatomic,copy) NSString *name; // 十日行走 在台湾,
@property (nonatomic,copy) NSString *photos_count; // 128,
@property (nonatomic,copy) NSString *days; // 10,
@property (nonatomic,copy) NSString *start_date; // 2014-05-30,
@property (nonatomic,copy) NSString *end_date; // 2014-06-08,
@property (nonatomic,copy) NSString *level; // 4,
@property (nonatomic,copy) NSString *views_count; // 12990,
@property (nonatomic,copy) NSString *comments_count; // 143,
@property (nonatomic,copy) NSString *likes_count; // 478,
@property (nonatomic,copy) NSString *source; // web,
@property (nonatomic,copy) NSString *front_cover_photo_url; // http; ////p.chanyouji.cn/133093/1402930040658p18qii9u1til41ej51nmu18fkn46a.jpg,
@property (nonatomic,copy) NSString *featured; // true,// 是否是首页

@property (nonatomic,copy) NSString *serial_id;//": 213730,
@property (nonatomic,copy) NSString *serial_position;//": 1,
@property (nonatomic) ZZCTripsUserInfo  *user;

@property (nonatomic,copy) NSString *privacy;// false,
@property (nonatomic,copy) NSString *state;// "publish",


@end
