//
//  ZZCPhoto.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCPhoto.h"

@implementation ZZCPhoto
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
