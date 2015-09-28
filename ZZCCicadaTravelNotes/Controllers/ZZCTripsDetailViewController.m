//
//  ZZCTripsDetailViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-25.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCTripsDetailViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCHomeTripsDetailModel.h"
#import "ZZCTripDays.h"
#import "ZZCTripsDaysDestination.h"
#import "ZZCNodes.h"
#import "ZZCMemo.h"
#import "ZZCNotes.h"
#import "ZZCPhoto.h"
#import "ZZCVideo.h"
#import "ZZCNoteslikesComments.h"

#import "ZZCHomeTripsDetailModel.h"
#import "ZZCTripsDetailTableViewCell.h"
@interface ZZCTripsDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tripsTableView;
@end

@implementation ZZCTripsDetailViewController
{
    NSMutableArray *_homeTripsDetailData;
    
    CGFloat _titleH;
    CGFloat _commentH;
    CGFloat _photoH;
    CGFloat _descriptionH;

    
    NSNumber *_titleHeight;
    NSNumber *_commentHeight;
    NSNumber *_photoImageViewHeight;
    NSNumber *_descriptionHeight;

    NSMutableArray *_titleHeightArray;
    NSMutableArray *_commentHeightArray;
//    NSMutableArray *_photoHeightArray;
//    NSMutableArray *_descriptionHeightArray;
    
    NSMutableArray *_titleHeightArrayN;
    NSMutableArray *_commentHeightArrayN;
    NSMutableArray *_photoHeightArrayN;
    NSMutableArray *_descriptionHeightArrayN;
    
    NSMutableArray *_tripDaysNodesArray;
    NSMutableArray *_tripDaysNotesArray;

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)createData
{
    _homeTripsDetailData = [[NSMutableArray alloc]init];
    _titleHeightArray = [[NSMutableArray alloc]init];;
    _commentHeightArray = [[NSMutableArray alloc]init];
//    _photoHeightArray = [[NSMutableArray alloc]init];
//    _descriptionHeightArray = [[NSMutableArray alloc]init];
    
    _titleHeightArrayN = [[NSMutableArray alloc]init];;
    _commentHeightArrayN = [[NSMutableArray alloc]init];
    _photoHeightArrayN = [[NSMutableArray alloc]init];
    _descriptionHeightArrayN = [[NSMutableArray alloc]init];
    
    
    
    _tripDaysNodesArray = [NSMutableArray array];
    _tripDaysNotesArray = [NSMutableArray array];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.alpha = 0.1;
//    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self createData];
    [self createTableView];
    [self startTripsDetailRequest];
    [_tripsTableView registerNib:[UINib nibWithNibName:@"ZZCTripsDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}
//首页 游记详情 请求
- (void)startTripsDetailRequest
{
    NSString * url = [NSString stringWithFormat:TripsWithID,_requestId];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *tripsDetailDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         
         ZZCHomeTripsDetailModel *tripsDetailModel = [[ZZCHomeTripsDetailModel alloc]init];
         [tripsDetailModel setValuesForKeysWithDictionary:tripsDetailDic];
         [_homeTripsDetailData addObject:tripsDetailModel];
         
         
         
         // 分解提取数据 并 根据数据 计算 控件的高度
         
         for (ZZCTripDays *tripdays in tripsDetailModel.trip_days)
         {
             NSMutableArray *nodesArray = [NSMutableArray array];
             NSMutableArray *notesArray = [NSMutableArray array];
             
             NSMutableArray *_descriptionHeightArray = [[NSMutableArray alloc]init];
             NSMutableArray *_photoHeightArray = [[NSMutableArray alloc]init];

             for (ZZCNodes *nodes in tripdays.nodes)
             {
                 for (ZZCNotes *notes in nodes.notes)
                 {
                     //计算 描述 的高度
                     if (notes.descriptions.length == 0)
                     {
                         _descriptionH = 0;
                     }
                     else
                     {
                         _descriptionH = [notes.descriptions boundingRectWithSize:CGSizeMake(300, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height + 16;
                     }
                     _descriptionHeight = [NSNumber numberWithFloat:_descriptionH];
                     [_descriptionHeightArray addObject:_descriptionHeight];
                     
                     //计算 照片 的高度
                     if (notes.photo.image_width == nil)
                     {
                         _photoH = 0;
                     }
                     else
                     {
                         _photoH = [notes.photo.image_height  floatValue] * 320 / [notes.photo.image_width floatValue];
                     }
                     _photoImageViewHeight = [NSNumber numberWithFloat:_photoH];
                     [_photoHeightArray addObject:_photoImageViewHeight];
                     
                     [notesArray addObject:notes];
                 }
                 [nodesArray addObject:nodes];
                 
             }
             [_tripDaysNodesArray addObject:nodesArray];
             [_tripDaysNotesArray addObject:notesArray];
             
             
             [_photoHeightArrayN addObject:_photoHeightArray];
             [_descriptionHeightArrayN addObject:_descriptionHeightArray];
         }

         
         [_tripsTableView reloadData];
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"失败");
     }];
    
}

- (void)createTableView
{
    _tripsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568 - 10) style:UITableViewStylePlain];
    
    //解决 tableView 分割线 左边短了一截的问题
    if ([_tripsTableView respondsToSelector:@selector(setSeparatorInset:)]) //ios7
    {
        [_tripsTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tripsTableView respondsToSelector:@selector(setLayoutMargins:)]) //ios8
    {
        [_tripsTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    [_tripsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tripsTableView.delegate = self;
    _tripsTableView.dataSource = self;
    [self.view addSubview:_tripsTableView];
}
//解决 tableView 分割线 左边短了一截的问题
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tripsTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark - ======================= Header and Footer ========================
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    headView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:headView.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"DAY%ld",(long)section + 1];
    [headView addSubview:label];
    return headView;
}

#pragma mark - ======================= tableView DataSource ========================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_homeTripsDetailData.count != 0)
    {
        ZZCHomeTripsDetailModel *tripsDetail = _homeTripsDetailData[0];
        NSInteger numSectionCount = tripsDetail.trip_days.count;
        return numSectionCount;
    }
    //NSArray *tripsdaysArr =  tripsDetail.trip_days;
    //行程 天数 每一天就是一个section
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger notesCount = 0;
    ZZCHomeTripsDetailModel *tripsDetail = _homeTripsDetailData[0];
    ZZCTripDays *tripdays = tripsDetail.trip_days[section];
    
    for (ZZCNodes *nodes in tripdays.nodes)
    {
        notesCount = notesCount + nodes.notes.count;
    }
    
    NSInteger numRowCount = notesCount;
    return numRowCount;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_homeTripsDetailData.count)
    {
        CGFloat PH = [_photoHeightArrayN[indexPath.section][indexPath.row] floatValue];
        CGFloat DH = [_descriptionHeightArrayN [indexPath.section][indexPath.row] floatValue];
        CGFloat cellHeight = PH + DH + 50;

        return cellHeight;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZCTripsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    ZZCTripsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (_homeTripsDetailData.count)
    {
        ZZCNotes *notes = _tripDaysNotesArray[indexPath.section][indexPath.row];
        [cell fillCellWithMode: notes entryView:0 commnent:0 photo:[_photoHeightArrayN[indexPath.section][indexPath.row] floatValue] descriptions:[_descriptionHeightArrayN[indexPath.section][indexPath.row] floatValue]];
    }
    
    return cell;
}
@end
