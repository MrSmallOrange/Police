//
//  UIViewController+ZCExtension.h
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZCExtension)
+ (instancetype)viewControllerWithStoryboardName:(NSString *) storyboardName identifier:(NSString *)identifier;
@end
