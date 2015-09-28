//
//  ZZCDestinationsPlansDetailModel.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-16.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCPlansDetailDestination.h"
@interface ZZCDestinationsPlansDetailModel : NSObject
@property (nonatomic,copy) NSString *idNum; //1693,
@property (nonatomic,copy) NSString *name; //日本全景7日游,
@property (nonatomic,copy) NSString *description; //京都的优雅，东京大阪的时尚，富士山的秀美，北海道的浪漫一次体验，7天最全面的日本游线路。,
@property (nonatomic,copy) NSString *budget; //0,
@property (nonatomic,copy) NSString *budget_description; //,
@property (nonatomic,copy) NSString *tips; //,
@property (nonatomic,copy) NSString *start_date; //null,
@property (nonatomic,copy) NSString *current_user_favorite; //false,
@property (nonatomic,copy) NSString *updated_at; //1410504676,
@property (nonatomic,copy) NSString *image_url; //http://m.chanyouji.cn/plans/1693.jpg,
#warning S
@property (nonatomic,copy) NSMutableArray *plan_days;
@property (nonatomic) ZZCPlansDetailDestination *destination;//
@end
