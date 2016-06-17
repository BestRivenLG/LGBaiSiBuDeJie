//
//  ZLGGuanZhuViewController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGGuanZhuViewController.h"

@interface ZLGGuanZhuViewController ()

@end

@implementation ZLGGuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" selectedImage:@"friendsRecommentIcon-click" target:self action:@selector(click:)];
    
}

- (void)click:(UIButton *)sender{
    
    NSLog(@"%s",__func__);
}

@end
