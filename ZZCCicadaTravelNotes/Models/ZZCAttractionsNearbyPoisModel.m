//
//  ZZCAttractionsNearbyPoisModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCAttractionsNearbyPoisModel.h"

@implementation ZZCAttractionsNearbyPoisModel
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
    else if ([key isEqualToString:@"destination"])
    {
        _destination = [[ZZCPlanNodesDestination alloc] init];
        [_destination setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}@end
