//
//  ZZCDestinationContents.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCDestinationContents.h"

@implementation ZZCDestinationContents
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
@end
