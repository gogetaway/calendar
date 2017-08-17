//
//  KLCalendarSource.h
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLCalendarSource : NSObject

@property (nonatomic, readonly, strong) NSArray *dataArray;
@property (nonatomic, readonly,   copy) NSString *titleString;


+ (KLCalendarSource *)calenderDataSourceWith:(NSDate *)date;


@end
