//
//  ZZCPlanDays.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCPlanDays : NSObject
@property (nonatomic,copy) NSString *idNum;//: 5513,
@property (nonatomic,copy) NSString *memo;// "大阪本身是一个历史悠久的百川之城，沿穿城而过的水路漫游，既是大阪人的生活常态，也是游人感受水城气质的最好体验。更重要的是，每一条行走过的街道，每一个迎面而来的微笑，都勾勒出大阪生活之美，这样有人情味的城市让人感到无比的温暖和留恋。 \r\n#交通指南# \r\n建议购买大阪周游卡1日券，可随便乘坐大阪市内的地铁和巴士，还可免费入场28处旅游设施，2000日元/张，性价比非常高。 "
#warning S
@property (nonatomic,copy) NSMutableArray *plan_nodes;
@end
