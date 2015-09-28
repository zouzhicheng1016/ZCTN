//
//  ZZCDestinationsTripsModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCTripsUserInfo.h"
@interface ZZCDestinationsTripsModel : NSObject
@property (nonatomic,copy) NSString *idNum; //213390,
@property (nonatomic,copy) NSString *name; //霓虹国的樱雨季,
@property (nonatomic,copy) NSString *photos_count; //362,
@property (nonatomic,copy) NSString *start_date; //2015-03-31,
@property (nonatomic,copy) NSString *end_date; //2015-04-09,
@property (nonatomic,copy) NSString *days; //10,
@property (nonatomic,copy) NSString *level; //3,
@property (nonatomic,copy) NSString *views_count; //4764,
@property (nonatomic,copy) NSString *comments_count; //196,
@property (nonatomic,copy) NSString *likes_count; //519,
@property (nonatomic,copy) NSString *source; //app,
@property (nonatomic,copy) NSString *front_cover_photo_url; //http://p.chanyouji.cn/1428860241/31618DE6-FA93-4D72-A15E-403632A024EB.jpg,
@property (nonatomic,copy) NSString *featured; //false,
@property (nonatomic) ZZCTripsUserInfo *user;
@end
