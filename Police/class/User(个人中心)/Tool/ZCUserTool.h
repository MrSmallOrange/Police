//
//  ZCUserTool.h
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCUser.h"


@interface ZCUserTool : NSObject
+ (void)saveUser:(ZCUser *)user;
+ (void)deleteUser;
+ (ZCUser *)user;
+ (BOOL)isLogin;
@end
