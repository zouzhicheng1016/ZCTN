//
//  ZZCNotes.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCPhoto.h"
#import "ZZCVideo.h"

@interface ZZCNotes : NSObject

@property (nonatomic,copy) NSString *idNum; // 9138803,
@property (nonatomic,copy) NSString *row_order; // 0,
@property (nonatomic,copy) NSString *layout; // full,
@property (nonatomic,copy) NSString *col; // 0,

@property (nonatomic,copy) NSString *descriptions; // 这次长达一个月的肯尼亚之旅，体验了两种完全不同
@property (nonatomic,copy) NSString *updated_at; // 1424868992
@property (nonatomic) ZZCPhoto *photo;
@property (nonatomic) ZZCVideo *video;

@end
