//
//  ZLGWordTableViewController.m
//  bsbdj
//
//  Created by mac on 16/6/12.
//  Copyright © 2016年 ZLG. All rights reserved.
//

#import "ZLGWordTableViewController.h"

#import "ZLGTopicCell.h"

#import "ZLGTopic.h"

#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import <MJRefresh.h>

@interface ZLGWordTableViewController ()
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,assign)NSInteger page;
@property (copy,nonatomic)NSString *maxtime;
@property (nonatomic,strong)NSDictionary *param;
@end

@implementation ZLGWordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupRefresh];
    
//    [self getWordData];
}

static NSString * const LGTopicCellID = @"topic";

- (void)setupTableView {

    CGFloat Top = ZLGTitleViewY + ZLGTitleViewH;
    
    //设置tableView一些细节
    self.tableView.y = 0;
    //tableview内容边距调整
    self.tableView.contentInset = UIEdgeInsetsMake(Top, 0, 49, 0);
    //滚动条边距调整
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UINib *nib = [UINib nibWithNibName:@"ZLGTopicCell" bundle:nil];
 
     [self.tableView registerNib:nib forCellReuseIdentifier:LGTopicCellID];

}

- (void)setupRefresh {
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewData];
    }];
    
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadNextPageData];
    }];

    [self.tableView.mj_header beginRefreshing];
}


- (void)loadNewData {

//    [self startRequest];
    [self startOtherRequest];
}

- (void)startOtherRequest {
    
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSString *str = [NSString stringWithFormat:@"a=list&c=data&type=29"];
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?%@",str]];
    
        NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (!data || error) {
                
                [self.tableView.mj_header endRefreshing];
                
            }else{
                
                NSLog(@"currentThread == %@", [NSThread currentThread]);
                
                dispatch_async(dispatch_get_main_queue(), ^{

                    NSLog(@"currentThread2 == %@", [NSThread currentThread]);

                    NSError *err;
                    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                    
                    self.array = [ZLGTopic mj_objectArrayWithKeyValuesArray:responseDict[@"list"]];
                    
//                    主线程刷新UI
                    [self.tableView reloadData];
                    
                    [self.tableView.mj_header endRefreshing];
                    self.page = 0;
                });
            }
        }];
        [task resume];
        
}

- (void)startRequest
{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"data";
    param[@"type"] = @"29";
    self.param = param;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param
        progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable
                responseObject) {

        if (self.param != param) {
            return ;
        }

        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        //存maxtime
        self.maxtime = response[@"info"][@"maxtime"];
        self.array = [ZLGTopic mj_objectArrayWithKeyValuesArray:response[@"list"]];

        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        [self.tableView.mj_header endRefreshing];
        self.page = 0;


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];

    }];
}



- (void)loadNextPageData {
    
    self.page++;
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"a"] = @"list";
    param[@"c"] = @"data";
    param[@"type"] = @"29";
    param[@"page"] = @(self.page);
    param[@"maxtime"] = self.maxtime;
    self.param = param;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable
                    responseObject) {
            if (self.param != param) {
                return ;
            }
            
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            
            self.maxtime = response[@"info"][@"maxtime"];

            NSArray *modelArray = [ZLGTopic mj_objectArrayWithKeyValuesArray:response[@"list"]];
            [self.array addObjectsFromArray :modelArray];
            
            
            //主线程刷新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
            [self.tableView.mj_footer endRefreshing];
            
            NSLog(@"%@",response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self.tableView.mj_footer endRefreshing];

        }];
    
}


- (NSMutableArray *)array {
    
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    

    
    ZLGTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:LGTopicCellID ]; //forIndexPath:indexPath];
    
//    if (!cell) {
//        cell = [[ZLGTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }

    
    
    ZLGTopic *topic = self.array[indexPath.row];
    
    cell.topic = topic;
    
//    cell.textLabel.text = topic.name;
//    cell.detailTextLabel.text = topic.text;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


@end
