//
//  ZLGTabBar.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGTabBar.h"

@interface ZLGTabBar()
@property(nonatomic,weak)UIButton * plushBtn;
@end

@implementation ZLGTabBar

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //初始化操作
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        self.plushBtn = btn;
        [self addSubview:btn];
    }
    return self;
}

//布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.plushBtn.bounds = CGRectMake(0, 0, self.plushBtn.currentBackgroundImage.size.width, self.plushBtn.currentBackgroundImage.size.height);
    self.plushBtn.center = CGPointMake(self.frame.size.width *0.5, self.height* 0.5);
    int index = 0;
    CGFloat y = 0;
    CGFloat w = self.width*0.2;
    CGFloat h = self.height;
    
    for (UIView *view in self.subviews) {
        //通过字符串来创建类
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {

            CGFloat x = w * ((index == 2 ) ? ++index : index);
            view.frame = CGRectMake(x , y, w, h);
            index ++;
        }
    }
    
}


@end
