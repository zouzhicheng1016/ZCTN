//
//  ZZCTripDays.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCTripsDaysDestination.h"
@interface ZZCTripDays : NSObject
@property (nonatomic,copy) NSString *idNum; // 682909,
@property (nonatomic,copy) NSString *trip_date; // 2015-01-18,
@property (nonatomic,copy) NSString *day; // 1,
@property (nonatomic,copy) NSString *updated_at; // 1424981234,
@property (nonatomic,copy) NSString *noName; // null,

@property (nonatomic,copy) NSMutableArray *nodes;
@property (nonatomic) ZZCTripsDaysDestination *destination;
@end
