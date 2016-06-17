//
//  UIBarButtonItem+ZLGExtension.m
//  bsbdj
//
//  Created by mac on 16/6/8.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "UIBarButtonItem+ZLGExtension.h"

@implementation UIBarButtonItem (ZLGExtension)

+ (instancetype)itemWithImage:(NSString*)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action
{
    UIButton *left = [[UIButton alloc] init];
    [left setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [left setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    left.bounds = CGRectMake(0, 0, left.currentImage.size.width, left.currentImage.size.height);
    [left addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:left];
}

@end
