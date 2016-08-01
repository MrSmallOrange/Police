//
//  ZCHomeController.m
//  Police
//
//  Created by ZhangCheng on 16/7/20.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCHomeController.h"
#import "ZCPageView.h"
#import "ZCBusiness.h"
#import "ZCHomeCell.h"

#define ZCBusinessID @"business"

@interface ZCHomeController ()
/** 首页滚动图片*/
@property (nonatomic, weak) ZCPageView *pageView;
@property (nonatomic, strong) NSArray *businesses;
@property (nonatomic, strong) NSArray *otherBusinesses;
@property (nonatomic, strong) ZCHomeCell *cell;



@end

@implementation ZCHomeController

- (NSArray *)businesses
{
    if (_businesses == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"BusinessType" ofType:@"plist"];
        NSArray *busArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *busModel = [NSMutableArray array];
        
        for (NSDictionary *dic in busArray) {
            ZCBusiness *business = [ZCBusiness businessWithDictionary:dic];
            [busModel addObject:business];
            

        }
        _businesses = busModel;
        
        
        
    }
    
    return _businesses;
}
- (NSArray *)otherBusinesses
{
    if (_otherBusinesses == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"OtherBusinessType.plist" ofType:nil];
        NSArray *otherArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *otherModel = [NSMutableArray array];
        for (NSDictionary *dic in otherArray) {
            ZCBusiness *business = [ZCBusiness businessWithDictionary:dic];
            [otherModel addObject:business];
        }
        
        _otherBusinesses = otherModel;
        
        
    }
    
    return  _otherBusinesses;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WHGA"]];
    [titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    

    

}

- (void)setUp{
    
    ZCPageView *pageView = [ZCPageView pageView];
    pageView.imageNames = @[@"1-1.jpg", @"1-2.jpg", @"1-3.jpg", @"1-4.jpg"];
    pageView.x = 0;
    pageView.y = 0;
    pageView.width = self.view.width;
    pageView.height = 160;
    self.tableView.tableHeaderView = pageView;
    self.pageView = pageView;
    
    [self.tableView registerClass:[ZCHomeCell class] forCellReuseIdentifier:ZCBusinessID];
    self.tableView.allowsSelection = NO;
    
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //开启定时器
    [self.pageView startAutoScroll];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //暂停定时器
    [self.pageView stopAutoScroll];
}

#pragma mark - 设置ZCBusiness模型数组的ZCBusinessType属性
- (NSArray<ZCBusiness *> *)setArray:(NSArray<ZCBusiness *> *)businesses businessType:(ZCBusinessType)businessType{
    NSArray *busArray = businesses;
    for (ZCBusiness *bus in busArray) {
        bus.businessType = businessType;
    }
    
    return busArray;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZCHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ZCBusinessID];
    if (indexPath.section == 0) { //业务办理
        cell.business = [self setArray:self.businesses businessType:ZCBusinessTypeBusinessHandling];
    }else if(indexPath.section == 1){// 业务查询
        cell.business = [self setArray:self.otherBusinesses businessType:ZCBusinessTypeBusinessQuery];
    }
    [cell layoutIfNeeded];
    
    self.cell = cell;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    return self.cell.cellHeight;

    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 600;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *ID = @"header";
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (header == nil) {
        header = [[UIView alloc] init];
        

    }
    header.backgroundColor = [[UIColor alloc] initWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1.0];;

    UILabel *label = [[UILabel alloc] init];
    if (section == 0) {
        label.text =  @"在线办理";
    }else{
        label.text =  @"咨询投诉";
    }
    
    [label sizeToFit];

    label.x = 20;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor grayColor];
    [header addSubview:label];

    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000000000000000000000000000000000001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}






@end
