//
//  ZZCDestinationsModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCDestinationsModel : NSObject
@property (nonatomic,copy) NSString *idNum; // 55,
@property (nonatomic,copy) NSString *name_zh_cn; // 日本,
@property (nonatomic,copy) NSString *name_en; // Japan,
@property (nonatomic,copy) NSString *poi_count; // 976,
@property (nonatomic,copy) NSString *lat; // 36.2048,
@property (nonatomic,copy) NSString *lng; // 138.253,
@property (nonatomic,copy) NSString *image_url; // http://m.chanyouji.cn/destinations/55-portrait.jpg
@property (nonatomic,copy) NSString *updated_at; // 1428006741

@end
