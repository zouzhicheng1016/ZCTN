//
//  ZZCArticlesections.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCDescriptionUserIds.h"
#import "ZZCnote.h"
@interface ZZCArticlesections : NSObject
@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *image_url;//	http://m.chanyouji.cn/21622/1359182341608p17hqouuqo1gsur1rrum1pv7n421t.jpg

@property (nonatomic,copy) NSString *image_width;//	1067

@property (nonatomic,copy) NSString *image_height;//	1600

@property (nonatomic,copy) ZZCDescriptionUserIds *description_user_ids;//		{1}
#warning ATT√
@property (nonatomic,copy) NSString *descriptions;//	@1 神气又友善的大猫，说不定猫才是鼓浪屿真正的主人

@property (nonatomic,copy) ZZCnote *note;//		{4}

@end
