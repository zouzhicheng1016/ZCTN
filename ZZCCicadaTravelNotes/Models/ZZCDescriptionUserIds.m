//
//  ZZCDescriptionUserIds.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDescriptionUserIds.h"

@implementation ZZCDescriptionUserIds

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if (key&&value)
    {
        _commentID = key;
        _commentName = value;
    }
}

@end
