//
//  UIView+ZCExtension.m
//  BestNotElderSister
//
//  Created by ZhangCheng on 16/4/30.
//  Copyright © 2016年 ZhangCheng. All rights reserved.
//

#import "UIView+ZCExtension.h"

@implementation UIView (ZCExtension)
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat )centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
    
}

- (CGFloat)centerX
{
    return self.center.x;
    
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
    
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (BOOL)isShowingOnKeyWindow
{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    return !self.hidden && self.alpha > 0.01 && self.window == keyWindow && CGRectIntersectsRect(newFrame, winBounds);
}

+ (instancetype)viewFromeXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
@end
