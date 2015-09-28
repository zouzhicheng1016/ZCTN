//
//  ZZCPlanDays.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCPlanDays.h"
#import "ZZCPlanNodes.h"
@implementation ZZCPlanDays
- (id)init
{
    self = [super init];
    if (self)
    {
        _plan_nodes = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@"plan_nodes"])
    {
        for (NSDictionary *planNodesDic in value)
        {
            ZZCPlanNodes *plan_nodes = [[ZZCPlanNodes alloc]init];
            [plan_nodes setValuesForKeysWithDictionary:planNodesDic];
            [_plan_nodes addObject:plan_nodes];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
