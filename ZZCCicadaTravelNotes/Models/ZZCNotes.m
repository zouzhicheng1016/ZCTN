//
//  ZZCNotes.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCNotes.h"

@implementation ZZCNotes

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
    else if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptions"];
    }
    else if ([key isEqualToString:@"photo"])
    {
        _photo = [[ZZCPhoto alloc]init];
        [_photo setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"video"])
    {
        _video = [[ZZCVideo alloc]init];
        [_video setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
