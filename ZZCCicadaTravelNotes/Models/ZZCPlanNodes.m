//
//  ZZCPlanNodes.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCPlanNodes.h"

@implementation ZZCPlanNodes
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
}

@end
