//
//  ZZCDestinatonDetailViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by mac on 15-4-27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ZZCDestinatonDetailViewController.h"
#import "ZZCAddress.h"
#import "AFNetworking.h"
#import "ZZCDestinationsDetailModel.h"
#import "ZZCDestinationDetailCell.h"
#import "UIImageView+WebCache.h"
@interface ZZCDestinatonDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *destinationDetailTableView;

@end

@implementation ZZCDestinatonDetailViewController
{
    NSMutableArray *_destinationsDetailData;            //目的地详情 列表
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createData];
    [self createTableView];
    [self startDestinationsDetailRequest];    //目的地详情 列表 请求
    [self createTableView];
    [_destinationDetailTableView registerNib:[UINib nibWithNibName:@"ZZCDestinationDetailCell" bundle:nil] forCellReuseIdentifier:@"cell"];

}

- (void)createData
{
    _destinationsDetailData = [[NSMutableArray alloc]init];
}

//目的地详情 列表 请求
- (void)startDestinationsDetailRequest
{
    NSString * url = [NSString stringWithFormat:DestinationsWithID,_requestId];
    NSLog(@"%@",url);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *destinationsDetailArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *destinationsDetailDic in destinationsDetailArr)
        {
            ZZCDestinationsDetailModel *destinationsDetailModel = [[ZZCDestinationsDetailModel alloc]init];
            [destinationsDetailModel setValuesForKeysWithDictionary:destinationsDetailDic];
            [_destinationsDetailData addObject:destinationsDetailModel];
            
            [_destinationDetailTableView reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

- (void)createTableView
{
    _destinationDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 74, 320, 568 - 74) style:UITableViewStylePlain];
    _destinationDetailTableView.backgroundColor = [UIColor whiteColor
                                                   ];
    [_destinationDetailTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    _destinationDetailTableView.delegate = self;
    _destinationDetailTableView.dataSource = self;
    [self.view addSubview:_destinationDetailTableView];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 285;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _destinationsDetailData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZCDestinationDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ZZCDestinationsDetailModel *destinationModel = _destinationsDetailData[indexPath.row];
    cell.name_cnLabel.text = destinationModel.name_zh_cn;
    cell.name_enLabel.text = destinationModel.name_en;
    [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:destinationModel.image_url]];
    
    return cell;
}

@end
