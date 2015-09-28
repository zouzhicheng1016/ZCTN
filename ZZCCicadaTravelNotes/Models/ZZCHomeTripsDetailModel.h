//
//  ZZCHomeTripsDetailModel.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCTripsUserInfo.h"
@interface ZZCHomeTripsDetailModel : NSObject
@property (nonatomic,copy) NSString *idNum; // 203081,
@property (nonatomic,copy) NSString *name; // Jambo，Kenya！肯尼亚义工旅行,
@property (nonatomic,copy) NSString *photos_count; // 171,
@property (nonatomic,copy) NSString *start_date; // 2015-01-18,
@property (nonatomic,copy) NSString *end_date; // 2015-02-16,
@property (nonatomic,copy) NSString *level; // 4,
@property (nonatomic,copy) NSString *privacy; // false,
@property (nonatomic,copy) NSString *front_cover_photo_id; // 8572204,
@property (nonatomic,copy) NSString *views_count; // 17351,
@property (nonatomic,copy) NSString *comments_count; // 162,
@property (nonatomic,copy) NSString *likes_count; // 1978,
@property (nonatomic,copy) NSString *favorites_count; // 308,
@property (nonatomic,copy) NSString *state; // publish,
@property (nonatomic,copy) NSString *source; // app,
@property (nonatomic,copy) NSString *serial_id; // null,
@property (nonatomic,copy) NSString *serial_position; // null,
@property (nonatomic,copy) NSString *serial_next_id; // 0,
@property (nonatomic,copy) NSString *updated_at; // 1429052399,
@property (nonatomic,copy) NSMutableArray *trip_days;//数组
@property (nonatomic) ZZCTripsUserInfo *user; //模型
@property (nonatomic,copy) NSString *upload_token; // null,
@property (nonatomic,copy) NSString *current_user_favorite; // false,
@property (nonatomic,copy) NSString *password; // null,
@property (nonatomic,copy) NSString *front_cover_photo_url; // http; ////p.chanyouji.cn/203081/1424867323890p19f0bbrus17gf7l512sm1je21qrc2.jpg,
@property (nonatomic,copy) NSMutableArray *notes_likes_comments;//数组
@end