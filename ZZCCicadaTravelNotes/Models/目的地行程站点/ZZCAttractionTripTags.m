//
//  ZZCAttractionTripTags.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCAttractionTripTags.h"
#import "ZZCAttractionContents.h"
@implementation ZZCAttractionTripTags
- (id)init
{
    self = [super init];
    if (self)
    {
        _attraction_contents = [[NSMutableArray alloc]init];
        _attraction_trips = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"idNum"];
    }
    else if ([key isEqualToString:@"trips_count"])
    {
        [self setValue:value forKey:@"display_count"];
    }
    else if ([key isEqualToString:@"attraction_trips"])
    {
        for (NSDictionary *AttractionTripsDic in value)
        {
            ZZCAttractionContents *attractionTrips = [[ZZCAttractionContents alloc]init];
            [attractionTrips setValuesForKeysWithDictionary:AttractionTripsDic];
            [_attraction_trips addObject:attractionTrips];
        }
    }

    else if ([key isEqualToString:@"attraction_contents"])
    {
        for (NSDictionary *attractionContentsDic in value)
        {
            ZZCAttractionContents *attractionContents = [[ZZCAttractionContents alloc]init];
            [attractionContents setValuesForKeysWithDictionary:attractionContentsDic];
            [_attraction_contents addObject:attractionContents];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
