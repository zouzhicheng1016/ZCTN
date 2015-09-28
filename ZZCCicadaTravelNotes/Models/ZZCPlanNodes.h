//
//  ZZCPlanNodes.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCPlanNodesDestination.h"
@interface ZZCPlanNodes : NSObject
@property (nonatomic,copy) NSString *idNum; // 174614,
@property (nonatomic,copy) NSString *entry_id; // 156560,
@property (nonatomic,copy) NSString *position; // 0,
@property (nonatomic,copy) NSString *candidate; // false,
@property (nonatomic,copy) NSString *tips; // #国内到大阪# 从国内前往大阪的航班都降落在关西国际机场，从机场前往大阪市区可搭乘：南海电铁空港急行往返难波站（890日元、约42分钟）或关空机场巴士往返难波站（1,000日元、50分）等多种方式。,
@property (nonatomic,copy) NSString *lat; // 34.43489,
@property (nonatomic,copy) NSString *lng; // 135.244451,
@property (nonatomic,copy) NSString *distance; // 0,
@property (nonatomic,copy) NSString *image_url; // http; ////m.chanyouji.cn/attractions/156560.jpg,
@property (nonatomic,copy) NSString *entry_name; // 关西国际机场,
@property (nonatomic,copy) NSString *entry_type; // Attraction,
@property (nonatomic,copy) NSString *attraction_type; // transport,
@property (nonatomic,copy) NSString *user_entry; // false,
@property (nonatomic) ZZCPlanNodesDestination *destination; //
@end
