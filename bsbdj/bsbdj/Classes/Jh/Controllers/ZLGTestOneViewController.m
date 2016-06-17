//
//  ZLGTestOneViewController.m
//  bsbdj
//
//  Created by mac on 16/6/8.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGTestOneViewController.h"
#import "ZLGTestTwoViewController.h"
@implementation ZLGTestOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ZLGTestTwoViewController *tc = [[ZLGTestTwoViewController alloc] init];
    [self.navigationController pushViewController:tc animated:YES];
}


@end
