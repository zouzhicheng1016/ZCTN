//
//  ZZCNodes.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCNodes.h"
#import "ZZCMemo.h"
#import "ZZCNotes.h"
@implementation ZZCNodes
- (id)init
{
    self = [super init];
    if (self)
    {
        _notes = [NSMutableArray array];
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
    else if ([key isEqualToString:@"memo"])
    {
        _memo = [[ZZCMemo alloc]init];
        [_memo setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"notes"])
    {
        for (NSDictionary *notesDic in value)
        {
            ZZCNotes *note = [[ZZCNotes alloc]init];
            
            [note setValuesForKeysWithDictionary:notesDic];
            [_notes addObject:note];
            
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
