//
//  ZZCTabBarViewController.m
//  ZZCCicadaTravelNotes
//
//  Created by zzc on 15-4-19.
//  Copyright (c) 2015年 zzc. All rights reserved.
//

#import "ZZCTabBarViewController.h"

@interface ZZCTabBarViewController ()<ZZCTabBarDelegate>

//自定义的tabbar
@property (nonatomic, weak) ZZCTabBarView *customTabBar;

@end

@implementation ZZCTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setupTabbar
{
    ZZCTabBarView *customTabBar = [[ZZCTabBarView alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(ZZCTabBarView *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

- (void)setupAllChildViewControllers
{
    // 1.精选
    ZZCHomeViewController *home = [[ZZCHomeViewController alloc] init];
    [self setupChildViewController:home title:@"精选" imageName:@"TabBarIconFeaturedNormal" selectedImageName:@"TabBarIconFeatured"];
    
    // 2.目的地
    ZZCDestinationsViewController *destinations = [[ZZCDestinationsViewController alloc] init];
    [self setupChildViewController:destinations title:@"目的地" imageName:@"TabBarIconDestinationNormal" selectedImageName:@"TabBarIconDestination"];

    // 3.我的
    ZZCMyTravelViewController *myTravel = [[ZZCMyTravelViewController alloc] init];
    [self setupChildViewController:myTravel title:@"我的" imageName:@"TabBarIconMyNormal" selectedImageName:@"TabBarIconMy"];

    // 4.离线
    ZZCOutLineViewController *outLine = [[ZZCOutLineViewController alloc] init];
    [self setupChildViewController:outLine title:@"离线" imageName:@"TabBarIconOfflineNormal" selectedImageName:@"TabBarIconOffline"];
}

/**
  *  初始化一个子控制器
  *
  *  @param childVc           需要初始化的子控制器
  *  @param title             标题
  *  @param imageName         图标
  *  @param selectedImageName 选中的图标
  */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    
    childVc.tabBarItem.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBar.barTintColor = ZZCColor(48, 148, 221);
    
//    NSArray *titleArr = @[@"蝉游记",@"旅行口袋书",@"我的旅行",@"离线内容"];
    
    //设置Title的字体颜色
    UIColor *color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    nav.navigationBar.titleTextAttributes = dict;
    
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
