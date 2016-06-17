//
//  ZLGJingHuaViewController.m
//  bsbdj
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGJingHuaViewController.h"
#import "ZLGTestOneViewController.h"
#import "ZLGAllTableViewController.h"
#import "ZLGVedioTableViewController.h"
#import "ZLGSoundTableViewController.h"
#import "ZLGPictureTableViewController.h"
#import "ZLGWordTableViewController.h"

@interface ZLGJingHuaViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIView *indicatorView;
@property (nonatomic,strong)UIButton *selectedBtn;
@property (nonatomic,strong)UIView *titleView;
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ZLGJingHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];

    
    [self setupTitleView];
//    UIView *view = [[UIView alloc] init];
    
    [self addChildView];

    
    [self setupScrollView];
    
    
}

- (void)setupNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" selectedImage:@"MainTagSubIconClick" target:self action:@selector(click:)];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)setupTitleView {
    
    NSArray *titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子"];

    
    CGFloat title_Y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat title_H = ZLGTitleViewH;

    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, title_Y, self.view.width, 35)];
    titleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    CGFloat indicatorView_Y = titleView.height - 2;
    CGFloat indicatorView_H = 2;
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.height = indicatorView_H;
    indicatorView.y = indicatorView_Y;
    indicatorView.backgroundColor = [UIColor redColor];
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    
    CGFloat btn_W = self.view.width/titleArray.count;
    CGFloat btn_Y = 0;
    CGFloat btn_X;
    
    for (int i = 0; i<titleArray.count; i++) {
        
        btn_X = i*btn_W;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btn_X, btn_Y, btn_W, title_H)];
        
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [titleView addSubview:btn];
        
        btn.tag = i;
        if (i == 0) {
            NSLog(@"%f",btn.titleLabel.width);
            //不加这个，指示器就显示不出来，因为按键title宽度为0，强制刷新按键视图，按键title宽度就出来了
            [btn layoutIfNeeded];
            NSLog(@"%f",btn.titleLabel.width);
            [self selectedAction:btn];
        }
    }
}

- (void)selectedAction:(UIButton *)sender {
    //交换三部曲
    self.selectedBtn.enabled = YES;
    sender.enabled = NO;
    self.selectedBtn = sender;
    
    [UIView animateWithDuration:0.25 animations:^{
        //宽度先定下来，再赋值centerX，不然其实的x会有偏差
        self.indicatorView.width = sender.titleLabel.width;
        self.indicatorView.centerX = sender.centerX;
    }];
    
    NSInteger i = sender.tag;
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = self.scrollView.width*i;
    [self.scrollView setContentOffset:offset animated:YES];
    
    
}

- (void)click:(UIButton *)sender {
    
    NSLog(@"%s",__func__);
    
    ZLGTestOneViewController *oc = [[ZLGTestOneViewController alloc] init];
    [self.navigationController pushViewController:oc animated:YES];
    
}

- (void)setupScrollView {

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.delegate = self;
    [self.view insertSubview:scrollView atIndex:0];
    CGFloat contentSize_W = self.childViewControllers.count *scrollView.width;
    scrollView.contentSize = CGSizeMake(contentSize_W, 0);
    scrollView.pagingEnabled = YES;
    
    self.scrollView  = scrollView;

}

- (void)addChildView {
    
    ZLGAllTableViewController *ac = [[ZLGAllTableViewController alloc] init];
    [self addChildViewController:ac];
    
    ZLGVedioTableViewController *vc = [[ZLGVedioTableViewController alloc] init];
    [self addChildViewController:vc];
    
    ZLGSoundTableViewController *sc = [[ZLGSoundTableViewController alloc] init];
    [self addChildViewController:sc];
    
    ZLGPictureTableViewController *pc = [[ZLGPictureTableViewController alloc] init];
    [self addChildViewController:pc];
    
    ZLGWordTableViewController *wc = [[ZLGWordTableViewController alloc] init];
    [self addChildViewController:wc];
}

#pragma -- mark UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    
    //获取当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //根据角标取出我们的子控制器
    UIViewController * vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.height = scrollView.height;
    
    //添加View
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger i = scrollView.contentOffset.x / scrollView.width;
    NSLog(@"%@", self.titleView.subviews);
    
    //0 是 titleView;btn 1~5;
    
    UIButton *btn = self.titleView.subviews[++i];
    [self selectedAction:btn];
    [self scrollViewDidEndScrollingAnimation:scrollView];
   
    
    
    
}

@end
