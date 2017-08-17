//
//  KLCalenderDateModel.h
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,KLCalenderDateModelType)
{
    KLCalenderDateModelPrevious,
    KLCalenderDateModelCurrent,
    KLCalenderDateModelNext
};

@interface KLCalenderDateModel : NSObject

@property (nonatomic,   copy) NSString *showDate;
@property (nonatomic,   copy) NSString *dateString;
@property (nonatomic, assign) KLCalenderDateModelType type;

@end
