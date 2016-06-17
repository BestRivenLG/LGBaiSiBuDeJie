//
//  ZLGTabBarController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGTabBarController.h"
#import "ZLGJingHuaViewController.h"
#import "ZLGXinTieViewController.h"
#import "ZLGJingHuaViewController.h"
#import "ZLGGuanZhuViewController.h"
#import "ZLGProfileViewController.h"
#import "ZLGBaseNavigationController.h"

#import "ZLGTabBar.h"

#import "UIImage+ZLGExtension.h"

@interface ZLGTabBarController ()

@end

@implementation ZLGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZLGJingHuaViewController *jC = [[ZLGJingHuaViewController alloc] init];
    [self addChildController:jC image:[UIImage imageWithOriginalName:@"tabBar_essence_icon"] selectedImage:[UIImage imageWithOriginalName:@"tabBar_essence_click_icon"] title:@"精华"];

    ZLGXinTieViewController *xC = [[ZLGXinTieViewController alloc] init];
    [self addChildController:xC image:[UIImage imageWithOriginalName:@"tabBar_new_icon"] selectedImage:[UIImage imageWithOriginalName:@"tabBar_new_click_icon"] title:@"新帖"];
    
    ZLGGuanZhuViewController *gC = [[ZLGGuanZhuViewController alloc] init];
    [self addChildController:gC image:[UIImage imageWithOriginalName:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageWithOriginalName:@"tabBar_friendTrends_click_icon"] title:@"关注"];
    
    ZLGProfileViewController *pC = [[ZLGProfileViewController alloc] init];
    [self addChildController:pC image:[UIImage imageWithOriginalName:@"tabBar_me_icon"] selectedImage:[UIImage imageWithOriginalName:@"tabBar_me_click_icon"] title:@"我"];

}

- (void)addChildController:(UIViewController *)childController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    ZLGBaseNavigationController *nav = [[ZLGBaseNavigationController alloc] initWithRootViewController:childController];
    childController.title = title;
    
    //设置文字 注意:文字大小只能在Normal状态下设置
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : ZLGColor(81,79,79)};
    
    NSDictionary *selectedAttrs = @{NSForegroundColorAttributeName:ZLGColor(81,79,79)};
    
    [childController.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [childController.tabBarItem setImage:image];
    [childController.tabBarItem setSelectedImage:selectedImage];
    [self addChildViewController:nav];
    
    
    ZLGTabBar *tabBar = [[ZLGTabBar alloc] init];
    //kvc 设置键值
    [self setValue:tabBar forKey:@"tabBar"];
    
}

@end
