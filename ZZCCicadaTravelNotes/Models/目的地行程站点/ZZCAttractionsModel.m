//
//  ZZCAttractionsModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCAttractionsModel.h"
#import "ZZCAttractionTripTags.h"
#import "ZZCAttractionContributors.h"
#import "ZZCAttractionAttractions.h"
#import "ZZCAttractionHotels.h"
@implementation ZZCAttractionsModel
- (id)init
{
    self = [super init];
    if (self)
    {
        _attraction_trip_tags = [[NSMutableArray alloc]init];
        _contributors = [[NSMutableArray alloc]init];
        _attractions = [[NSMutableArray alloc]init];
        _hotels = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@"attraction_trip_tags"])
    {
        for (NSDictionary *attractionTripTagsDic in value)
        {
            ZZCAttractionTripTags *attraction_trip_tags = [[ZZCAttractionTripTags alloc]init];
            [attraction_trip_tags setValuesForKeysWithDictionary:attractionTripTagsDic];
            [_attraction_trip_tags addObject:attraction_trip_tags];
        }
    }
    else if ([key isEqualToString:@"contributors"])
    {
        for (NSDictionary *contributorsDic in value)
        {
            ZZCAttractionContributors *contributors = [[ZZCAttractionContributors alloc]init];
            [contributors setValuesForKeysWithDictionary:contributorsDic];
            [_contributors addObject:contributors];
        }
    }
    else if ([key isEqualToString:@"attractions"])
    {
        for (NSDictionary *attractionsDic in value)
        {
            ZZCAttractionAttractions *attractions = [[ZZCAttractionAttractions alloc]init];
            [attractions setValuesForKeysWithDictionary:attractionsDic];
            [_attractions addObject:attractions];
        }
    }
    else if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptions"];
    }
    else if ([key isEqualToString:@"destination"])
    {
        _destination = [[ZZCPlanNodesDestination alloc]init];
        [_destination setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"hotels"])
    {
        for (NSDictionary *hotelsDic in value)
        {
            ZZCAttractionHotels *hotels = [[ZZCAttractionHotels alloc]init];
            [hotels setValuesForKeysWithDictionary:hotelsDic];
            [_hotels addObject:hotels];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
