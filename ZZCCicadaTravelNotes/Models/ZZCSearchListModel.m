//
//  ZZCSearchListModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCSearchListModel.h"
#import "ZZCSearchDestinations.h"
@implementation ZZCSearchListModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _china_destinations = [[NSMutableArray alloc]init];
        _other_destinations = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"china_destinations"])
    {
        for (NSDictionary *chinaDestinationsDic in value)
        {
            ZZCSearchDestinations *china_destinations = [[ZZCSearchDestinations alloc]init];
            [china_destinations setValuesForKeysWithDictionary:chinaDestinationsDic];
            [_china_destinations addObject:china_destinations];
        }
    }
    else if ([key isEqualToString:@"other_destinations"])
    {
        for (NSDictionary *otherDestinationsDic in value)
        {
            ZZCSearchDestinations *other_destinations = [[ZZCSearchDestinations alloc]init];
            [other_destinations setValuesForKeysWithDictionary:otherDestinationsDic];
            [_other_destinations addObject:other_destinations];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
