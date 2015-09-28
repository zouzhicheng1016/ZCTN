//
//  ZZCDestinationsCategoryModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDestinationsCategoryModel.h"
#import "ZZCDestinationsModel.h"
@implementation ZZCDestinationsCategoryModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _destinations = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"destinations"])
    {
        for (NSDictionary *destinationsDetailDic in value)
        {
            ZZCDestinationsModel *destinationsModel = [[ZZCDestinationsModel alloc]init];
            [destinationsModel setValuesForKeysWithDictionary:destinationsDetailDic];
            [_destinations addObject:destinationsModel];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
