//
//  ZCUser.h
//  Police
//
//  Created by ZhangCheng on 16/7/26.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCUser : NSObject
/** 邮箱*/
@property (nonatomic, copy) NSString *email;
/** 手机号*/
@property (nonatomic, assign) NSInteger mobileNo;
/** 真是姓名*/
@property (nonatomic, copy) NSString *realName;
/** zhuangtai*/
@property (nonatomic, assign) NSInteger realState;
/** 用户id*/
@property (nonatomic, copy) NSString *sid;
/** 身份证号*/
@property (nonatomic, assign) NSInteger userName;
/** 头像url*/
@property (nonatomic, copy) NSString *userPicUrl;




@end
