//
//  ZCUserTool.m
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCUserTool.h"



@implementation ZCUserTool
+ (void)saveUser:(ZCUser *)user{
    [NSKeyedArchiver archiveRootObject:user toFile:[self path]];
    
}

+ (void)deleteUser{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:[self path] error:nil];
}

+ (ZCUser *)user{
    ZCUser *user = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
    return user;
}

+ (NSString *)path{
    NSString *cachPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [cachPath stringByAppendingPathComponent:@"user.plist"];
    return path;
}

+ (BOOL)isLogin{
    ZCUser *user = [self user];
    if (user == nil) {
        return NO;
    }else{
        return YES;
    }
}
@end
