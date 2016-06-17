//
//  ZLGXinTieViewController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGXinTieViewController.h"

@interface ZLGXinTieViewController ()

@end

@implementation ZLGXinTieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" selectedImage:@"MainTagSubIconClick" target:self action:@selector(click:)];}

- (void)click:(UIButton *)sender{
    
    NSLog(@"%s",__func__);
}

@end
