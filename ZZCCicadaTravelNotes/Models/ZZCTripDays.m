//
//  ZZCTripDays.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCTripDays.h"
#import "ZZCNodes.h"
@implementation ZZCTripDays
- (id)init
{
    self = [super init];
    if (self)
    {
        _nodes = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@""])
    {
        [self setValue:value forKey:@"noName"];
    }
    else if ([key isEqualToString:@"nodes"])
    {
        for (NSDictionary *nodesDic in value)
        {
            ZZCNodes *nodes = [[ZZCNodes alloc]init];
            [nodes setValuesForKeysWithDictionary:nodesDic];
            [_nodes addObject:nodes];
        }
    }
    else if ([key isEqualToString:@"destination"])
    {
        _destination = [[ZZCTripsDaysDestination alloc]init];
        [_destination setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }

}
@end
