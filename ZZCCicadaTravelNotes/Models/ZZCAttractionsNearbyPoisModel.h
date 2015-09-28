//
//  ZZCAttractionsNearbyPoisModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCPlanNodesDestination.h"
@interface ZZCAttractionsNearbyPoisModel : NSObject
@property (nonatomic,copy) NSString *idNum; //156560,
@property (nonatomic,copy) NSString *name; //关西国际机场,
@property (nonatomic,copy) NSString *lat; //34.43489,
@property (nonatomic,copy) NSString *lng; //135.244451,
@property (nonatomic,copy) NSString *attraction_type; //transport,
@property (nonatomic,copy) NSString *type; //Attraction,
@property (nonatomic) ZZCPlanNodesDestination *destination;
@end
