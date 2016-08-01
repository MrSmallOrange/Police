//
//  ZCBusiness.m
//  Police
//
//  Created by MrSmallOrange on 16/7/25.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCBusiness.h"

@implementation ZCBusiness
+ (instancetype)businessWithDictionary:(NSDictionary *)dictionary
{
    ZCBusiness *business = [[ZCBusiness alloc] init];
    business.title = dictionary[@"title"];
    business.image = dictionary[@"image"];
    business.typeKey = dictionary[@"typeKey"];
    return business;
}
@end
