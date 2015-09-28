//
//  ZZCAttractionsModel.h
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZCPlanNodesDestination.h"
@interface ZZCAttractionsModel : NSObject
@property (nonatomic,copy) NSString *idNum; //156560,
@property (nonatomic,copy) NSString *name_zh_cn; //关西国际机场,
@property (nonatomic,copy) NSString *name_en; //Kansai Airport,
#warning ATT √
@property (nonatomic,copy) NSString *descriptions; //关西国际机场（关西空港）是位于大阪湾东岸的填海国际机场，距离大阪市区约50公里。,
@property (nonatomic,copy) NSString *tips_html; //<strong>#交通信息#</strong>\n<p>作为关西地区的航空枢纽，关西机场与大阪、京都、神户的交通联系非常密切，包括：</p>\n\n<p>铁路——JR西日本关西机场线往返大阪（约50分钟）、往返京都（约75分钟）、和歌山（约35分钟）南海电气铁道往返大阪难波站，根据车次不同耗时34～43分钟不等；<br>\n高速船——直达神户机场，船费成人1,800日元、儿童900日元；<br>\n直达巴士——大阪难波（单程1,000日元、50分钟）、京都（单程2,500日元、2小时）、奈良（单程2,000日元、1小时）、神户（单程1,900日元、1.5小时）。</p>\n<strong>#关西机场到大阪#</strong>\n<p>JR西日本（关西机场线）关西机场快速，票价1,160日元，单程62分钟</p>\n<strong>#关西机场到京都#</strong>\n<p>JR的关空特急HARUKA，票价3,290日元起，单程75分钟。</p>\n<strong>#关西机场到神户#</strong>\n<p>JR快速列车至大阪站，换乘JR新快速列车至神户中央区的三宫站，单程票价为1,660日元。</p>\n<strong>#服务指南#</strong>\n<p>关西国际机场是前往关西地区国际旅客抵达日本的首站。机场内设有观光综合问询处，位于第1航站楼1楼中央区，提供上午7:00～晚上10:00的咨询、交通票务、和宾馆预定服务。受理电话：＋81(0)72-455-2911。</p>\n,
@property (nonatomic,copy) NSString *user_score; //4.55,
@property (nonatomic,copy) NSString *photos_count; //1206,
@property (nonatomic,copy) NSString *attraction_trips_count; //293,
@property (nonatomic,copy) NSString *lat; //34.43489,
@property (nonatomic,copy) NSString *lng; //135.244451,
@property (nonatomic,copy) NSString *attraction_type; //transport,
@property (nonatomic,copy) NSString *address; //日本〒549-0001 大阪府泉佐野市泉州空港北１,
@property (nonatomic,copy) NSString *ctrip_id; //null,
@property (nonatomic,copy) NSString *updated_at; //1405567989,
@property (nonatomic,copy) NSString *image_url; //http://m.chanyouji.cn/attractions/156560.jpg,
@property (nonatomic,copy) NSString *attractions_count; //733,
@property (nonatomic,copy) NSString *activities_count; //0,
@property (nonatomic,copy) NSString *restaurants_count; //0,
#warning S
@property (nonatomic,copy) NSMutableArray *attraction_trip_tags;//
@property (nonatomic) ZZCPlanNodesDestination *destination;
#warning S
@property (nonatomic,copy) NSMutableArray *contributors; //
#warning S
@property (nonatomic,copy) NSMutableArray *attractions;//附近旅行地
#warning S
@property (nonatomic,copy) NSMutableArray *hotels; //附近酒店
@property (nonatomic,copy) NSString *current_user_favorite; //false
@end
