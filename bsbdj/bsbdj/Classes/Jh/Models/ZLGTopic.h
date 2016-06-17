//
//  ZLGTopic.h
//  bsbdj
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLGTopic : NSObject
/** 名称 */
@property(copy,nonatomic)NSString * name;
/** 头像 */
@property(copy,nonatomic)NSString * profile_image;
/** 时间 */
@property(copy,nonatomic)NSString * create_time;
/** 内容 */
@property(copy,nonatomic)NSString * text;
/** 顶的数量 */
@property(assign,nonatomic)NSInteger ding;
/** 踩 */
@property(assign,nonatomic)NSInteger cai;
/** 转发 */
@property(assign,nonatomic)NSInteger repost;
/** 评论数量 */
@property(assign,nonatomic)NSInteger comment;
@end
