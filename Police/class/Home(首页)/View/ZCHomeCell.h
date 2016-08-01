//
//  ZCHomeCell.h
//  Police
//
//  Created by MrSmallOrange on 16/7/25.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZCBusiness;
@interface ZCHomeCell : UITableViewCell
@property (nonatomic, strong) NSArray<ZCBusiness *> *business;
@property (nonatomic, assign) CGFloat cellHeight;
@end
