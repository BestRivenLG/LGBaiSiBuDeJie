//
//  ZLGPushGuideView.m
//  bsbdj
//
//  Created by mac on 16/6/8.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGPushGuideView.h"

@implementation ZLGPushGuideView

+ (instancetype)guideView
{
    ZLGPushGuideView *guideView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
    return guideView;
}

+ (void)show
{
    
    //拿到当前的版本号
    //拿到info.plist
    NSString *KEY = @"CFBundleShortVersionString";
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary]objectForKey:KEY];
    //拿到沙盒中的版本号
    NSString *shaBoxVersion = [[NSUserDefaults standardUserDefaults] objectForKey:KEY];
    //判断版本号是否一致
    if (![currentVersion isEqualToString:shaBoxVersion]) {
        //创建我们的引导页
        ZLGPushGuideView *guideView = [self guideView];
        guideView.frame = [UIApplication sharedApplication].keyWindow.bounds;
        
        [[UIApplication sharedApplication].keyWindow addSubview:guideView];
        //存储版本号到沙盒!!!
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:KEY];
        //要它立刻马上存入到沙盒!!
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


- (IBAction)removeAction:(id)sender {
    
    [self removeFromSuperview];
}

@end
