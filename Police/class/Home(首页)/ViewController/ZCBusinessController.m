//
//  ZCBusinessController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/26.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCBusinessController.h"
#import <AFNetworking.h>
#import "ZCBusiness.h"
#import "ZCBusinessHandlingDetail.h"
#import "ZCBusinessQueryDetail.h"
#import "ZCBusinessList.h"
#import "MJExtension.h"
#import "ZCUserTool.h"
#import "MJRefresh.h"

@interface ZCBusinessController ()
@property (nonatomic, strong) ZCBusinessList *businessList;

@end

@implementation ZCBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self  setUpNav];
    
    [self refresh];



}

- (void)setUpNav{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"帮助" style:UIBarButtonItemStyleDone target:self action:@selector(help)];
    self.title = self.business.title;
    
}

- (void)refresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_header.hidden = NO;
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData{
    if (self.business.businessType == ZCBusinessTypeBusinessHandling) {
        [self loadBusinessHandlingData];
    }else if (self.business.businessType == ZCBusinessTypeBusinessQuery){
        [self loadBusinessQueryData];
    }

    
}

- (void)loadMoreData{
    if (self.business.businessType == ZCBusinessTypeBusinessHandling) {
        [self loadMoreBusinessHandlingData];
    }else if (self.business.businessType == ZCBusinessTypeBusinessQuery){
        [self loadMoreBusinessQueryData];
    }
}

#pragma mark - 加载业务办理的数据
- (void)loadBusinessHandlingData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"areaCode"] = @"420100";
    parameters[@"type"] = self.business.typeKey;
    parameters[@"pageNo"] = @"1";
    parameters[@"pageSize"] = @"10";
    
    [manager POST:@"http://59.175.192.203:8060/policeService/BIZ/getBIZList.do" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_header.hidden = YES;
        [ZCBusinessList mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"results" : [ZCBusinessHandlingDetail class] };
        }];
        
        
        NSDictionary *dic = (NSDictionary *)responseObject[@"respInfo"][@"BIZLIST"];
        ZCBusinessList *businessList = [ZCBusinessList mj_objectWithKeyValues:dic];
        self.businessList = businessList;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@ 失败" , error);
        
    }];
}
#pragma mark - 加载业务查询的数据
- (void)loadBusinessQueryData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    ZCUser *user = [ZCUserTool user];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"sid"] = user.sid;
    parameters[@"pageNo"] = @"1";
    parameters[@"pageSize"] = @"10";


    [manager POST:@"http://59.175.192.203:8060/policeService/TSZXBIZ/getZXList.do" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ZCBusinessList mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"results" : [ZCBusinessQueryDetail class] };
        }];
        
        NSDictionary *dic = (NSDictionary *)responseObject[@"respInfo"][@"BIZLIST"];
        ZCBusinessList *businessList = [ZCBusinessList mj_objectWithKeyValues:dic];
        self.businessList = businessList;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@ 失败" , error);
        
    }];
}
#pragma mark - 加载更多业务办理的数据
- (void)loadMoreBusinessHandlingData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"areaCode"] = @"420100";
    parameters[@"type"] = self.business.typeKey;
    parameters[@"pageNo"] = @"1";
    parameters[@"pageSize"] = @"10";
    
    [manager POST:@"http://59.175.192.203:8060/policeService/BIZ/getBIZList.do" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_header.hidden = YES;
        [ZCBusinessList mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"results" : [ZCBusinessHandlingDetail class] };
        }];
        
        
        NSDictionary *dic = (NSDictionary *)responseObject[@"respInfo"][@"BIZLIST"];
        ZCBusinessList *businessList = [ZCBusinessList mj_objectWithKeyValues:dic];
        self.businessList = businessList;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@ 失败" , error);
        
    }];
}
#pragma mark - 加载更多业务查询的数据
- (void)loadMoreBusinessQueryData{
    
}
- (void)help{
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businessList.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"business";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    ZCBusinessHandlingDetail *businessDetail = self.businessList.results[indexPath.row];
    
    cell.textLabel.text = businessDetail.sxmc;
    cell.detailTextLabel.text = businessDetail.sxjj;
    
    
    return cell;
}


@end
