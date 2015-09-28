//
//  ZZCAddress.h
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-14.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#ifndef ZZCCicadaTravelNotes_ZZCAddress_h
#define ZZCCicadaTravelNotes_ZZCAddress_h
//接口文档测试地址
//http://cgabtiyhu.com
//http://192.168.0.1

//内网域名
#define KInnerSite @"/http://192.168.0.1"
//公网域名
#define KWebSite @"http://cgabtiyhu.com"


//一、精选 （首页）

//1.游记 (page 1)
#define TripsFeatured @"http://chanyouji.com/api/trips/featured.json?page=%d"

//游记详情（id 203081）
#define TripsWithID @"http://chanyouji.com/api/trips/%@.json"

//用户详情（id 152482 page 1 id在上面游记的user属性里面获取）
#define UserInfoWithUserID @"http://chanyouji.com/api/users/152482.json?page=1"

//用户详情（1.游记  2.喜欢）
//_a 用户的游记       和首页用户详情一样
// UserInfo      @"http://chanyouji.com/api/users/88593.json?page=1"
//用户游记详情       和首页游记一样
// Articles      @"http://chanyouji.com/api/trips/190908.json"

//_b 用户的喜欢 (id 88593 page 1)
#define UserLikeWithUserID @"http://chanyouji.com/api/users/likes/88593.json?per_page=15&page=1"

//2.专题 (page 1)
#define Articles @"http://chanyouji.com/api/articles.json?page=%d"

//专题详情（id 113）
#define ArticlesWithID @"http://chanyouji.com/api/articles/%@.json"

//二、目的地

//界面首页 array[0] ~ array[4]:[国外.亚洲] [国外.欧洲] [美洲、大洋洲、非洲及南极洲] [国内.港澳台] [国内.大陆]
#define Destinations @"http://chanyouji.com/api/destinations.json"

//指定目的地详情列表 (id 48)
#define DestinationsWithID @"http://chanyouji.com/api/destinations/%@.json"

//1.指定目的地cell的 所有 专题 (id 48 page 1)
#define ArticlesWithDestinationsID @"http://chanyouji.com/api/articles.json?destination_id=%d&page=%d"

#warning Rem
//专题详情 (id 113)  专题详情 如 首页专题 一样
// ArticlesWithID @"http://chanyouji.com/api/articles/113.json"

//2.指定目的地cell的 所有 行程 (id 48 page 1)
#define PlansWithDestinationsID @"http://chanyouji.com/api/destinations/plans/%d.json?page=%d"

//行程详情 (id 1693)
#define PlansWithID @"http://chanyouji.com/api/plans/%d.json"

//站点详情(旅行地) (id 156560)
#define AttractionsWithID @"http://chanyouji.com/api/attractions/%d.json"


//站点图片(id 35443 page 1)
#define AttractionsPhotos @"http://chanyouji.com/api/attractions/photos/%d.json?page=%d"
//站点游记(id 35443 page 1)
#define AttractionTrips @"http://chanyouji.com/api/attractions/%d.json?attraction_trips=true&page=%d"
//站点地图(id 156560)
#define NearbyPois @"http://chanyouji.com/api/attractions/nearby_pois/%d.json"


//3.指定目的地cell的 所有 旅行地 (id 48 page 1)
#define AttractionsWithDestinationsID @"http://chanyouji.com/api/destinations/attractions/%d.json?page=%d"

#warning Rem
//旅行地详情（id 34872） 旅行地详情 如 站点详情 一样
// AttractionsWithID @"http://chanyouji.com/api/attractions/34872.json"
//4.指定目的地 cell的所有游记 (id 48 page 1)
#define TripsWithDestinationsID @"http://chanyouji.com/api/destinations/trips/%d.json?page=%d"

#warning Rem
//游记详情 游记详情 如 首页 的 游记详情 一样
// Articles @"http://chanyouji.com/api/trips/123476.json"

//三、我的 (我的ID：503714)
//登录：
//POST
#define Login @"http://chanyouji.com/api/tokens.json"
//email=876516196%40qq.com&password=1016112
//注册：
#define Register @"http://chanyouji.com/api/users.json"
//email=919826832%40qq.com&name=&password=1016112

//设置资料
#define SettingInfo @"http://chanyouji.com/api/users/505939.json"
//1.游记
//http://chanyouji.com/api/trips.json
//http://chanyouji.com/api/users/503714.json?page=1

//2收藏
//http://chanyouji.com/api/favorites.json?page=1

//3喜欢
//http://chanyouji.com/api/users/likes/503714.json?per_page=15&page=1

//4其他
//_a.我的好友
//粉丝：
#define FansWithUserID @"http://chanyouji.com/api/friends/users.json?page=1&user_id=503714"
//关注：
#define AttentionWithUserID @"http://chanyouji.com/api/friends.json?page=1&user_id=503714"

//_b.旅行地图
#define TravelMapsWithUserID @"http://chanyouji.com/api/users/map/503714.json"

//四、离线

//五、搜索

//A、搜索界面
//列表 （国内 china_destinations[0~33] 国外 other_destinations[0~96]）
#define SearchList @"http://chanyouji.com/api/destinations/list.json"

//点击列表选项 进入指定目的地（id 61 page 1）
//和目的地游记列表一样  @"http://chanyouji.com/api/destinations/trips/61.json?page=1"

//四季 (1-12) (month 2 page 1)
#define TripsWithMonth @"http://chanyouji.com/api/trips/month/%d.json?page=%d"

//B、搜索框搜索结果 (q=%E6%B9%96%E5%8C%97) /湖北/
//1、游记
#define SearchTripsWithSearchContents @"http://chanyouji.com/api/search/trips.json"

//2、旅行地
#define SearchAttractionsWithSearchContents @"http://chanyouji.com/api/search/attractions.json"

//3、用户
#define SearchUsersWithSearchContents @"http://chanyouji.com/api/search/users.json"



#endif
