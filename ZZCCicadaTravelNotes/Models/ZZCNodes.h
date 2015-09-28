//
//  ZZCNodes.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-15.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCMemo.h"
#import "ZZCNotes.h"
@interface ZZCNodes : NSObject
@property (nonatomic,copy) NSString *idNum; // 1616267,
@property (nonatomic,copy) NSString *row_order; // 0,
@property (nonatomic,copy) NSString *score; // 0,
@property (nonatomic,copy) NSString *comment; // null,
@property (nonatomic,copy) NSString *tips; // null,
@property (nonatomic) ZZCMemo *memo; // {},//moxing
@property (nonatomic,copy) NSString *entry_id; // null,
@property (nonatomic,copy) NSString *lat; // 0,
@property (nonatomic,copy) NSString *lng; // 0,
@property (nonatomic,copy) NSString *entry_type; // null,
@property (nonatomic,copy) NSString *user_entry; // false,
@property (nonatomic,copy) NSString *entry_name; // null,
@property (nonatomic,copy) NSString *attraction_type; // null,
@property (nonatomic,copy) NSString *updated_at; // 1424337675,

@property (nonatomic,copy) NSMutableArray *notes; // //shuzu
@end
