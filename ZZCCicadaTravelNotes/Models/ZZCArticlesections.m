//
//  ZZCArticlesections.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCArticlesections.h"

@implementation ZZCArticlesections
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"description_user_ids"])
    {
        _description_user_ids = [[ZZCDescriptionUserIds alloc]init];
        [_description_user_ids setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptions"];
    }

    else if ([key isEqualToString:@"note"])
    {
        _note = [[ZZCnote alloc]init];
        [_note setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
