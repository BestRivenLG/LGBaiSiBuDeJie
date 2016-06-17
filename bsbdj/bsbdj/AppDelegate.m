//
//  AppDelegate.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLGTabBarController.h"
#import "ZLGPushGuideView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[ZLGTabBarController  alloc] init];
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
    //显示引导页
    [ZLGPushGuideView show];
    
    return YES;
}

@end
