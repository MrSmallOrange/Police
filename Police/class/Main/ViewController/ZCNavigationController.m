//
//  ZCNavigationController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/20.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCNavigationController.h"


@interface ZCNavigationController ()

@end

@implementation ZCNavigationController

+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:53/255.0 green:80/255.0 blue:177/255.0 alpha:1.0];
    
    NSMutableDictionary *titleAttribute = [NSMutableDictionary dictionary];
    titleAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:titleAttribute];
    
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:attribute forState:UIControlStateNormal];

    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}




@end
