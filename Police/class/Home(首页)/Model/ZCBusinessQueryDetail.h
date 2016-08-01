//
//  ZCBusinessQueryDetail.h
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBusinessQueryDetail : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *acceptSubject;
/** */
@property (nonatomic, assign) NSInteger cellphone;
/** */
@property (nonatomic, assign) NSInteger cityCode;
/** */
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createdtime;
@property (nonatomic, copy) NSString *feedback;
/** */
@property (nonatomic, assign) NSInteger pushStatus;
@property (nonatomic, copy) NSString *slDepartment;
/** */
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *title;
@end







