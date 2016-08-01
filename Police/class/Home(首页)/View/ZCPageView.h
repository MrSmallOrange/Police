//
//  ZCPageView.h
//  Police
//
//  Created by ZhangCheng on 16/7/23.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPageView : UIView
/** 图片名字*/
@property (nonatomic, strong) NSArray *imageNames;
+ (instancetype)pageView;
- (void)startAutoScroll;
- (void)stopAutoScroll;
@end
