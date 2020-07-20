//
//  OneViewController.m
//  CustomTabBar
//
//  Created by yang.sun on 2020/6/15.
//  Copyright © 2020 sun. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor colorWithRed:222 green:222 blue:222 alpha:1];

       view.layer.shadowColor = [UIColor redColor].CGColor;
    //    阴影偏移量
        view.layer.shadowOffset = CGSizeMake(0, -10);
    //    阴影透明度
        view.layer.shadowOpacity = 1;
    //    阴影半径
        view.layer.shadowRadius = 5;
    [self.view addSubview:view];
    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
//    imageView.image = [UIImage imageNamed:@"StockNavBar"];
//    NSArray *array = [NSArray arrayWithObjects:[UIImage imageNamed:@"StockNavBar"],[UIImage imageNamed:@"StockNavBarSelect"], nil];
//    imageView.animationImages = array;
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//    imageView.animationDuration = 1.5;
//            //动画的重复次数，想让它无限循环就赋成0
//            imageView.animationRepeatCount = 0;
//            //添加控件
//    [self.view addSubview:imageView];
//
//    [imageView startAnimating];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
