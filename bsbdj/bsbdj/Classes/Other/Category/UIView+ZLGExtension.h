//
//  UIView+ZLGExtension.h
//  bsbdj
//
//  Created by mac on 16/6/8.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import <UIKit/UIKit.h>
//在分类中@property 只会声明方法,不会生成方法的实现和_成员属性
@interface UIView (ZLGExtension)
/** X坐标 */
@property (nonatomic,assign)CGFloat x;
/** Y坐标 */
@property (nonatomic,assign)CGFloat y;
/** 宽度 */
@property (nonatomic,assign)CGFloat width;
/** 高度 */
@property (nonatomic,assign)CGFloat height;
/** 尺寸 */
@property(assign,nonatomic) CGSize size;
/** 中心X坐标 */
@property(assign,nonatomic) CGFloat centerX;
/** 中心Y坐标 */
@property(assign,nonatomic) CGFloat centerY;
@end
