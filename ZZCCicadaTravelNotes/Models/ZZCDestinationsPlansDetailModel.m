//
//  ZZCDestinationsPlansDetailModel.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCDestinationsPlansDetailModel.h"
#import "ZZCPlanDays.h"
@implementation ZZCDestinationsPlansDetailModel
- (id)init
{
    self = [super init];
    if (self)
    {
        _plan_days = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@"destination"])
    {
        _destination = [[ZZCPlansDetailDestination alloc] init];
        [_destination setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"plan_days"])
    {
        for (NSDictionary *planDaysDic in value)
        {
            ZZCPlanDays *plan_days = [[ZZCPlanDays alloc]init];
            [plan_days setValuesForKeysWithDictionary:planDaysDic];
            [_plan_days addObject:plan_days];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
