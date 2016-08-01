//
//  UIViewController+ZCExtension.m
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "UIViewController+ZCExtension.h"

@implementation UIViewController (ZCExtension)
+ (instancetype)viewControllerWithStoryboardName:(NSString *) storyboardName identifier:(NSString *)identifier{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return vc;
}
@end
