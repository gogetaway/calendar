//
//  KLCalendarManager.h
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLCalendarManager : NSObject

+(instancetype)shareManager;
- (NSArray *)calenderArrayDataSource;
- (void)transitionToNextMonth;

- (void)transitionToPreviouslyMonth;
@end
