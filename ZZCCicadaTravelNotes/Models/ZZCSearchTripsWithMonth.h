//
//  ZZCSearchTripsWithMonth.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCTripsUserInfo.h"

@interface ZZCSearchTripsWithMonth : NSObject
@property (nonatomic,copy) NSString *idNum; //214001,
@property (nonatomic,copy) NSString *name; //3000里奇幻摘星之旅——云南大环线自驾,
@property (nonatomic,copy) NSString *photos_count; //128,
@property (nonatomic,copy) NSString *start_date; //2015-02-15,
@property (nonatomic,copy) NSString *end_date; //2015-02-22,
@property (nonatomic,copy) NSString *days; //8,
@property (nonatomic,copy) NSString *level; //3,
@property (nonatomic,copy) NSString *views_count; //1997,
@property (nonatomic,copy) NSString *comments_count; //11,
@property (nonatomic,copy) NSString *likes_count; //123,
@property (nonatomic,copy) NSString *source; //web,
@property (nonatomic,copy) NSString *front_cover_photo_url; //http://p.chanyouji.cn/214001/1429161960539p19j0aq0qb1oov19i632omtq17g13f.jpg,
@property (nonatomic,copy) NSString *featured; //false,
@property (nonatomic) ZZCTripsUserInfo *user;
@end
