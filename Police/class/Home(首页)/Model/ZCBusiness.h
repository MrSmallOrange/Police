//
//  ZCBusiness.h
//  Police
//
//  Created by MrSmallOrange on 16/7/25.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBusiness : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *typeKey;
/** 业务类型*/
@property (nonatomic, assign) ZCBusinessType businessType;
+ (instancetype)businessWithDictionary:(NSDictionary *)dictionary;
@end
