//
//  ZZCBaseHeader.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCBaseHeader.h"

@implementation ZZCBaseHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 20)];
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_headerLabel];
    }
    return self;
}

@end
