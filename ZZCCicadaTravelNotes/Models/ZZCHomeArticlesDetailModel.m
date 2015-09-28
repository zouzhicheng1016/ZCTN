//
//  ZZCHomeArticlesDetailModel.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCHomeArticlesDetailModel.h"
#import "ZZCArticlesections.h"
@implementation ZZCHomeArticlesDetailModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _article_sections = [[NSMutableArray alloc]init];
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
    if ([key isEqualToString:@"article_sections"])
    {
        for (NSDictionary *articlesectionsDic in value)
        {
            ZZCArticlesections *articlesections = [[ZZCArticlesections alloc]init];
            [articlesections setValuesForKeysWithDictionary:articlesectionsDic];
            [_article_sections addObject:articlesections];
        }

    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
