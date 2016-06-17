//
//  UIImage+ZLGExtension.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "UIImage+ZLGExtension.h"

@implementation UIImage (ZLGExtension)

+ (UIImage *)imageWithOriginalName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
