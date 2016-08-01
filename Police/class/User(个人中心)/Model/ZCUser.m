//
//  ZCUser.m
//  Police
//
//  Created by ZhangCheng on 16/7/26.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCUser.h"

@implementation ZCUser
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeInteger:self.mobileNo forKey:@"mobileNo"];
    [aCoder encodeObject:self.realName forKey:@"realName"];
    [aCoder encodeInteger:self.realState forKey:@"realState"];
    [aCoder encodeObject:self.sid forKey:@"sid"];
    [aCoder encodeInteger:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userPicUrl forKey:@"userPicUrl"];

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.mobileNo = [aDecoder decodeIntegerForKey: @"mobileNo"];
        self.realName = [aDecoder decodeObjectForKey: @"realName"];
        self.realState = [aDecoder decodeIntegerForKey: @"realState"];
        self.sid = [aDecoder decodeObjectForKey: @"sid"];
        self.userName = [aDecoder decodeIntegerForKey: @"userName"];
        self.userPicUrl = [aDecoder decodeObjectForKey: @"userPicUrl"];
        
    }
    
    return self;
}
@end
