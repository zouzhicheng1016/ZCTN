//
//  ZZCDestinationsDetailModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDestinationsDetailModel.h"
#import "ZZCWeather.h"
#import "ZZCDestinationContents.h"
@implementation ZZCDestinationsDetailModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _weather = [[NSMutableArray alloc]init];
        _destination_contents = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@"weather"])
    {
        for (NSDictionary *weatherDic in value)
        {
            ZZCWeather *weather = [[ZZCWeather alloc]init];
            [weather setValuesForKeysWithDictionary:weatherDic];
            [_weather addObject:weather];
        }
    }
    else if ([key isEqualToString:@"destination_contents"])
    {
        for (NSDictionary *destinationContentsDic in value)
        {
            ZZCDestinationContents *destinationContents = [[ZZCDestinationContents alloc]init];
            [destinationContents setValuesForKeysWithDictionary:destinationContentsDic];
            [_destination_contents addObject:destinationContents];
        }
    }
    else if ([key isEqualToString:@"intro"])
    {
        _intro = [[ZZCIntro alloc]init];
        [_intro setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
