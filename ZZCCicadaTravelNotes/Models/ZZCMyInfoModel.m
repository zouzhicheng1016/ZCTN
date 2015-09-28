//
//  ZZCMyInfoModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCMyInfoModel.h"

@implementation ZZCMyInfoModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _authorizations = [[NSMutableArray alloc]init];
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
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
