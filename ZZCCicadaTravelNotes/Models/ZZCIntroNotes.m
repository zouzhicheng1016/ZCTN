//
//  ZZCIntroNotes.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCIntroNotes.h"

@implementation ZZCIntroNotes
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptions"];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
