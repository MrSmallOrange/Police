//
//  ZCTabBarController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/20.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCTabBarController.h"
#import "ZCNavigationController.h"
#import "ZCHomeController.h"
#import "ZCNearByController.h"
#import "ZCUserController.h"


@interface ZCTabBarController ()

@end

@implementation ZCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ZCHomeController *home = [[ZCHomeController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChildViewController:home imageName:@"Home" title:@"首页"];
    
    ZCNearByController *nearBy  = [[ZCNearByController alloc] init];
    [self addChildViewController:nearBy imageName:@"NearBy" title:@"附近"];
    
    ZCUserController *user = [ZCUserController userController];
    [self addChildViewController:user imageName:@"User" title:@"个人"];
}

- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName title:(NSString *)title{
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    ZCNavigationController *nav = [[ZCNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
}


@end
