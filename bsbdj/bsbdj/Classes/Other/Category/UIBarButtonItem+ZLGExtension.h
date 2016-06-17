//
//  UIBarButtonItem+ZLGExtension.h
//  bsbdj
//
//  Created by mac on 16/6/8.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZLGExtension)

+ (instancetype)itemWithImage:(NSString*)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action;

@end
