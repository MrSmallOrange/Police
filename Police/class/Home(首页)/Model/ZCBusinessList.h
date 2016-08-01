//
//  ZCBusinessList.h
//  Police
//
//  Created by MrSmallOrange on 16/7/26.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBusinessList : NSObject

/** 总数*/
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, strong) NSArray *results;
/** 总页数*/
@property (nonatomic, assign) NSInteger pageCount;
/** 当前页码*/
@property (nonatomic, assign) NSInteger currentPage;
/** 一页有多少条目*/
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageNo;


@end
