//
//  ZLGProfileViewController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGProfileViewController.h"

@interface ZLGProfileViewController ()

@end

@implementation ZLGProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *moon = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selectedImage:@"mine-moon-icon-click" target:self action:@selector(moonClick:)];
    UIBarButtonItem *setting = [UIBarButtonItem itemWithImage:@"mine-setting-icon" selectedImage:@"mine-setting-icon-click" target:self action:@selector(settingClick:)];
    self.navigationItem.rightBarButtonItems = @[setting,moon];
    
}

- (void)moonClick:(UIButton *)sender{
    
    NSLog(@"%s",__func__);
}

- (void)settingClick:(UIButton *)sender{
    
    NSLog(@"%s",__func__);
}
@end
