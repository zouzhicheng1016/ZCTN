//
//  ZZCIntro.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCIntro.h"
#import "ZZCIntroNotes.h"
@implementation ZZCIntro
- (instancetype)init
{
    self = [super init];
    if (self) {
        _notes = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@类这个字段没有定义%@",[NSString stringWithUTF8String:object_getClassName(self)],key);
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"notes"])
    {
        for (NSDictionary *notesDic in value)
        {
            ZZCIntroNotes *notes = [[ZZCIntroNotes alloc]init];
            [notes setValuesForKeysWithDictionary:notesDic];
            [_notes addObject:notes];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
