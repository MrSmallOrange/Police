//
//  ZCUserController.m
//  Police
//
//  Created by ZhangCheng on 16/7/20.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCUserController.h"
#import "ZCUserTool.h"
#import "ZCUserInformationController.h"
#import "ZCLoginController.h"
#import "ZCSettingController.h"

@interface ZCUserController ()
@property (weak, nonatomic) IBOutlet UILabel *loginStatusLabel;

@end

@implementation ZCUserController

+ (instancetype)userController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    ZCUserController *user  = [storyboard instantiateViewControllerWithIdentifier:@"user"];
    
    return user;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"个人中心";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    if (![ZCUserTool isLogin]) {
        self.loginStatusLabel.text = @"点击此处登陆";
    }else{
        self.loginStatusLabel.text = @"已登录";
    }
}

- (void)setting{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    
    ZCSettingController *setting = [storyboard instantiateViewControllerWithIdentifier:@"setting"];
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
    
    
}



#pragma mark - Table view delegate source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        if ([ZCUserTool isLogin]) {
            ZCUserInformationController *userInformation = [ZCUserInformationController viewControllerWithStoryboardName:NSStringFromClass([self class]) identifier:@"userInformation"];
            userInformation.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:userInformation animated:YES];
        }else{
            ZCLoginController *login = [ZCLoginController viewControllerWithStoryboardName:NSStringFromClass([self class]) identifier:@"login"];
            [self presentViewController:login animated:YES completion:nil];
        }
    }
}






@end
