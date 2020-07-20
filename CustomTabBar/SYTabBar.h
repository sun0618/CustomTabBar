//
//  SYTabBar.h
//  CustomTabBar
//
//  Created by yang.sun on 2020/7/18.
//  Copyright © 2020 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYTabBar;

NS_ASSUME_NONNULL_BEGIN

@protocol SYTabBarDelegate <NSObject>

- (void)tabBarMidButtonClick:(SYTabBar *)tabBar;

@end

@interface SYTabBar : UITabBar

/** tabbar的代理 */
@property (nonatomic, weak) id<SYTabBarDelegate> myDelegate ;

@end

NS_ASSUME_NONNULL_END
