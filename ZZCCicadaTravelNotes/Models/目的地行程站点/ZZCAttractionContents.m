//
//  ZZCAttractionContents.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCAttractionContents.h"
#import "ZZCAttractionContentsNotes.h"
@implementation ZZCAttractionContents
- (id)init
{
    self = [super init];
    if (self)
    {
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
    if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"idNum"];
    }
    else if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptions"];
    }
    else if ([key isEqualToString:@"trip"])
    {
         _trip = [[ZZCAttractionContentsTrip alloc]init];
        [_trip setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"notes"])
    {
        for (NSDictionary *notesDic in value)
        {
            ZZCAttractionContentsNotes *notes = [[ZZCAttractionContentsNotes alloc]init];
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
