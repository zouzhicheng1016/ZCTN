//
//  ZZCHomeTripsDetailModel.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCHomeTripsDetailModel.h"
#import "ZZCTripDays.h"
#import "ZZCNoteslikesComments.h"
@implementation ZZCHomeTripsDetailModel
- (id)init
{
    self = [super init];
    if (self)
    {
        _trip_days = [[NSMutableArray alloc]init];
        _notes_likes_comments = [[NSMutableArray alloc]init];
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
    else if ([key isEqualToString:@"trip_days"])
    {
        for (NSDictionary *tripsDaysDic in value)
        {
            ZZCTripDays *tripsDays = [[ZZCTripDays alloc]init];
            [tripsDays setValuesForKeysWithDictionary:tripsDaysDic];
            [_trip_days addObject:tripsDays];
            
        }
    }
    else if ([key isEqualToString:@"notes_likes_comments"])
    {
        for (NSDictionary *noteslikesCommentsDic in value)
        {
            ZZCNoteslikesComments *noteslikesComments = [[ZZCNoteslikesComments alloc]init];
            [noteslikesComments setValuesForKeysWithDictionary:noteslikesCommentsDic];
            [_notes_likes_comments addObject:noteslikesComments];
            
        }
    }
    else if ([key isEqualToString:@"user"])
    {
        _user = [[ZZCTripsUserInfo alloc] init];
        [_user setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}
@end
