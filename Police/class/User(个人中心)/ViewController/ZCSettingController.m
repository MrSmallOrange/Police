//
//  ZCSettingController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCSettingController.h"
#import "ZCUserTool.h"

@interface ZCSettingController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *logoffCell;
@end

@implementation ZCSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([ZCUserTool isLogin]) {
        self.logoffCell.hidden = NO;
    }else{
        self.logoffCell.hidden = YES;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ZCUserTool deleteUser];
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
