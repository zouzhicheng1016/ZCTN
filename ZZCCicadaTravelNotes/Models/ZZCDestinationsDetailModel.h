//
//  ZZCDestinationsDetailModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCIntro.h"
@interface ZZCDestinationsDetailModel : NSObject

@property (nonatomic,copy) NSString *idNum; //55,
@property (nonatomic,copy) NSString *name_zh_cn; //日本,
@property (nonatomic,copy) NSString *name_en; //Japan,
@property (nonatomic,copy) NSString *poi_count; //976,
@property (nonatomic,copy) NSString *plans_count; //6,
@property (nonatomic,copy) NSString *articles_count; //6,
@property (nonatomic,copy) NSString *contents_count; //2473,
@property (nonatomic,copy) NSString *destination_trips_count; //2743,
@property (nonatomic,copy) NSString *locked; //false,
@property (nonatomic,copy) NSString *updated_at; //1428006741,
@property (nonatomic,copy) NSString *image_url; //http://m.chanyouji.cn/destinations/55-landscape.jpg,
@property (nonatomic,copy) NSString *guides_count; //7,
@property (nonatomic,copy) NSMutableArray *destination_contents;
@property (nonatomic,copy) NSMutableArray *weather;	//	[12]

@property (nonatomic) ZZCIntro *intro;	//	{1}

@end
