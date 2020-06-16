//
//  AppDelegate.m
//  CustomTabBar
//
//  Created by yang.sun on 2020/6/15.
//  Copyright © 2020 sun. All rights reserved.
//

#import "AppDelegate.h"

#import "RootTabBarController.h"

#import "OneViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    RootTabBarController *root = [[RootTabBarController alloc] init];
    self.window.rootViewController = root;
    
    //    [self serverIP];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
