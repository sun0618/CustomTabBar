//
//  RootTabBarController.m
//  CustomTabBar
//
//  Created by yang.sun on 2020/6/15.
//  Copyright © 2020 sun. All rights reserved.
//

#import "RootTabBarController.h"

#import "TabbarBackView.h"

#import "SYTabBar.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#define iPhoneX (([UIScreen mainScreen].bounds.size.height) >= 812 ? YES : NO)
#define kBottomSafeHeight (iPhoneX ? 34 : 0)

@interface RootTabBarController ()<UITabBarControllerDelegate,SYTabBarDelegate>

@property (nonatomic,assign)CGFloat tabHeight;

@property (nonatomic,strong)OneViewController *onevc;
@property (nonatomic,strong)TwoViewController *twovc;
@property (nonatomic,strong)ThreeViewController *threevc;
@property (nonatomic,strong)FourViewController *fourvc;
@property (nonatomic,strong)FiveViewController *fivevc;

@property (nonatomic,strong)TabbarBackView *tabBarView;


@property (nonatomic,strong)SYTabBar *syTabBar;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
//    设置底部菜单栏高度
    _tabHeight = 75 + kBottomSafeHeight;
    [self clearTabBarTopLine];
    _tabBarView = [[TabbarBackView alloc] initWithFrame:CGRectMake(0, -26, UIScreen.mainScreen.bounds.size.width, _tabHeight)];
    _tabBarView.backgroundColor = [UIColor whiteColor];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    _syTabBar = [[SYTabBar alloc] init];
    _syTabBar.myDelegate = self;
     [self setValue:_syTabBar forKeyPath:@"tabBar"];
    
    [_syTabBar addSubview:_tabBarView];
    [self setBootomTabBar];
    

    [self clearTabBarTopLine];
    
//    设置字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//    [UIColor blackColor], NSForegroundColorAttributeName,
//    nil] forState:UIControlStateNormal];
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect frame = self.tabBar.frame;
    frame.size.height = 49 + kBottomSafeHeight;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    _syTabBar.frame = frame;
    
    _syTabBar.barStyle = UIBarStyleDefault;
//    for (int i=0; i<self.tabBar.items.count; i++) {
//        UITabBarItem *item = self.tabBar.items[i];
//        if (i!=2) {
//            item.imageInsets = UIEdgeInsetsMake(_tabHeight - 49 - kBottomSafeHeight - 15, 0, -(_tabHeight - 49 - kBottomSafeHeight - 15), 0);
//            item.titlePositionAdjustment = UIOffsetMake(0, -3);
//
//        } else if (i != 4) {
//            item.imageInsets = UIEdgeInsetsMake(-5, 0, 5, 0);
//            item.titlePositionAdjustment = UIOffsetMake(0, -3);
//
//        }
//    }
}

#pragma mark - 清除底部菜单栏上面自带的线，以便自定义
-(void)clearTabBarTopLine{
    CGRect rect = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef  clearColor =[[UIColor clearColor] CGColor];
    CGContextSetFillColor(context, CGColorGetComponents(clearColor));
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _syTabBar.backgroundImage = img;
    _syTabBar.shadowImage = img;
}

#pragma mark - 设置底部菜单栏
-(void)setBootomTabBar {
    self.onevc = [[OneViewController alloc] init];
    self.onevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"HomeNavBar"] tag:1];
    self.onevc.navigationItem.title = @"首页";
    self.onevc.tabBarItem.image = [UIImage imageNamed:@"HomeNavBar"];
    self.onevc.tabBarItem.selectedImage = [[UIImage imageNamed:@"HomeNavBarSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *hnav = [[UINavigationController alloc] initWithRootViewController:self.onevc];
    
    self.twovc = [[TwoViewController alloc] init];
    self.twovc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"管理" image:[UIImage imageNamed:@"StockNavBar"] tag:2];
    self.twovc.navigationItem.title = @"管理";
    self.twovc.tabBarItem.image = [UIImage imageNamed:@"StockNavBar"];
    self.twovc.tabBarItem.selectedImage = [[UIImage imageNamed:@"StockNavBarSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.twovc.tabBarItem.image = [UIImage imageNamed:@"StockNavBar"];
       self.twovc.tabBarItem.selectedImage = [[UIImage imageNamed:@"StockNavBarSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *snav = [[UINavigationController alloc] initWithRootViewController:self.twovc];
    
    self.threevc = [[ThreeViewController alloc] init];
    self.threevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"透明"] tag:3];
//    self.threevc.navigationItem.title = @"订单";
//    self.threevc.tabBarItem.image = [[UIImage imageNamed:@"OrderNavBar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.threevc.tabBarItem.selectedImage = [[UIImage imageNamed:@"OrderNavBar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *onav = [[UINavigationController alloc] initWithRootViewController:self.threevc];
    
    self.fourvc = [[FourViewController alloc] init];
    self.fourvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"报表" image:[UIImage imageNamed:@"ReportFormNavBar"] tag:4];
    self.fourvc.navigationItem.title = @"报表";
    self.fourvc.tabBarItem.image = [UIImage imageNamed:@"ReportFormNavBar"];
    self.fourvc.tabBarItem.selectedImage = [[UIImage imageNamed:@"ReportFormNavBarSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *rnav = [[UINavigationController alloc] initWithRootViewController:self.fourvc];
    
    self.fivevc = [[FiveViewController alloc] init];
//    self.fivevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@""] tag:5];
    self.fivevc.navigationItem.title = @"我的";
    self.fivevc.tabBarItem = [[UITabBarItem alloc] init];
    self.fivevc.tabBarItem.tag = 5;
    self.fivevc.tabBarItem.title = @"我的";
    self.fivevc.tabBarItem.image = [UIImage imageNamed:@"MineNavBar"];//图片不能为空，因此放一张全透明图片
    self.fivevc.tabBarItem.selectedImage = [[UIImage imageNamed:@"MineNavBarSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *mnav = [[UINavigationController alloc] initWithRootViewController:self.fivevc];
    
    
//    self.viewControllers = @[hnav,snav,rnav,mnav];
    self.viewControllers = @[hnav,snav,onav,rnav,mnav];
}

-(void)tabBarMidButtonClick:(SYTabBar *)tabBar {
    self.hidesBottomBarWhenPushed = YES;
    //         只能模态跳转，跳过去如果需要导航栏需要自定义
    //        设置通知模式在别的界面也许可以用导航栏跳转
    ThreeViewController *tvc = [[ThreeViewController alloc] init];
    ////        导航栏跳转
    //        [((UINavigationController *)tabBarController.selectedViewController) pushViewController:tvc animated:YES];
    
    tvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tvc animated:NO completion:nil];
}

#pragma mark - 拦截点击跳转，处理中间一个TabBar
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if (tabBarController.tabBar.selectedItem.tag == 3) {
        self.hidesBottomBarWhenPushed = YES;
//         只能模态跳转，跳过去如果需要导航栏需要自定义
//        设置通知模式在别的界面也许可以用导航栏跳转
        ThreeViewController *tvc = [[ThreeViewController alloc] init];
////        导航栏跳转
//        [((UINavigationController *)tabBarController.selectedViewController) pushViewController:tvc animated:YES];
    
        tvc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:tvc animated:NO completion:nil];
        return NO;
    }
    return YES;
    
}


//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
//    
////    NSLog(@"12");
////
////    if (tabBar.selectedItem.tag == 5) {
//////        UIView *btnView = self.tabBar.subviews[3];
////        [_tabBarView.fiveImageView startAnimating];
////    }
//    
//}


@end
