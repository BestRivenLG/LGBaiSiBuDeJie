//
//  ZLGTopicCell.m
//  bsbdj
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGTopicCell.h"
#import "ZLGTopic.h"
#import <UIImageView+WebCache.h>

@interface ZLGTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *ding;

@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *share;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@end

@implementation ZLGTopicCell

- (void)setTopic:(ZLGTopic *)topic {
    
    _topic = topic;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.timeLabel.text = topic.create_time;
    [self.ding setTitle:[NSString stringWithFormat:@"%zd",topic.ding] forState:UIControlStateNormal];
    [self.cai setTitle:[NSString stringWithFormat:@"%zd",topic.cai] forState:UIControlStateNormal];
    [self.share setTitle:[NSString stringWithFormat:@"%zd",topic.repost] forState:UIControlStateNormal];
    [self.comment setTitle:[NSString stringWithFormat:@"%zd",topic.comment] forState:UIControlStateNormal];
}


@end
