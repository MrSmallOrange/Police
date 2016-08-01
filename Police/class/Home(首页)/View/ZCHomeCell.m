//
//  ZCHomeCell.m
//  Police
//
//  Created by MrSmallOrange on 16/7/25.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCHomeCell.h"
#import "ZCVerticalButton.h"
#import "ZCBusiness.h"
#import "ZCBusinessController.h"
#import "ZCTabBarController.h"
#import "ZCNavigationController.h"

@interface ZCHomeCell()
@property (nonatomic, strong) NSMutableArray *businessButtons;



@end

@implementation ZCHomeCell

- (NSMutableArray *)businessButtons{
    if (_businessButtons == nil) {
        _businessButtons = [NSMutableArray array];
    }
    
    return _businessButtons;
}






- (void)setBusiness:(NSArray<ZCBusiness *> *)business
{
    _business = business;
    
    
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.businessButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.businessButtons removeAllObjects];
    
    for (int i = 0; i < self.business.count;  i++) {
        
        ZCVerticalButton *businessBt = [[ZCVerticalButton alloc] init];
        businessBt.business = self.business[i];
        businessBt.titleLabel.font = [UIFont systemFontOfSize:15];
        [businessBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [businessBt setTitle:business[i].title forState:UIControlStateNormal];
        [businessBt setImage:[UIImage imageNamed:business[i].image] forState:UIControlStateNormal];
        [businessBt addTarget:self action:@selector(clickBusiness:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:businessBt];
        [self.businessButtons addObject:businessBt];
    }
    

    
    


}

- (void)clickBusiness:(ZCVerticalButton *)businessBt{
    ZCTabBarController *tabBar =  (ZCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    ZCNavigationController *nav =  (ZCNavigationController *)[tabBar selectedViewController];
    ZCBusinessController *businessController = [[ZCBusinessController alloc] init];
    businessController.business = businessBt.business;
    [nav pushViewController:businessController animated:YES];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat width = 60;
    CGFloat height = 70;

    
    
    int  maxCols = 3;
    
    CGFloat margin = (self.width - maxCols * width)/(maxCols * 2);

    int col;
    int row;
    
    for (int i = 0; i < self.businessButtons.count; i++) {
        ZCVerticalButton *view = self.businessButtons[i];
        view.width = width;
        view.height = height;
    
        col = i / maxCols;
        row = i % maxCols;
        
        view.x = margin +  row * (width + 2 * margin);
        view.y = margin +  col * (height + 2 * margin);
    }
    
    ZCVerticalButton *last = [self.businessButtons lastObject];
    self.cellHeight = CGRectGetMaxY(last.frame) + margin;
    
    
    
}
@end
