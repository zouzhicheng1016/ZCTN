//
//  ZZCMyInfoModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCMyInfoModel : NSObject
@property (nonatomic,copy) NSString *idNum; //503714,
@property (nonatomic,copy) NSString *name; //祭奠na些,
@property (nonatomic,copy) NSString *image; //http://a.chanyouji.cn/503714/1428974935174.jpg
@property (nonatomic,copy) NSString *gender; //1,
@property (nonatomic,copy) NSString *state; //active,
@property (nonatomic,copy) NSString *token; //o58epACo1T4RSPszqrzS,
@property (nonatomic,copy) NSString *image_large; //http://a.chanyouji.cn/503714/1428974935174.jpg
@property (nonatomic,copy) NSString *url; //http://chanyouji.com/users/503714,
@property (nonatomic,copy) NSString *favorites_count; //5,
@property (nonatomic,copy) NSString *likes_count; //10,
@property (nonatomic,copy) NSString *attraction_favorites_count; //0,
@property (nonatomic,copy) NSString *poi_favorites_count; //0,
@property (nonatomic,copy) NSString *friends_count; //2,
@property (nonatomic,copy) NSString *fans_count; //1,
@property (nonatomic,copy) NSString *trips_count; //1,
@property (nonatomic,copy) NSString *plans_count; //0,
@property (nonatomic,copy) NSMutableArray *authorizations;
@end
