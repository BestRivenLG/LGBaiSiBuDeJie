//
//  ZLGBaseNavigationController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGBaseNavigationController.h"

@interface ZLGBaseNavigationController ()

@end

@implementation ZLGBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        
        UIButton *back = [[UIButton alloc] init];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        back.size = CGSizeMake(100, 30);
        
        [back setTitle:@"返回" forState:UIControlStateNormal];
        [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [back setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        //设置内容靠左显示
        back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置内边距
        back.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
        
    }
    
    [super pushViewController:viewController animated:animated];

    
}

- (void)back:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    [self popViewControllerAnimated:YES];
}

@end
