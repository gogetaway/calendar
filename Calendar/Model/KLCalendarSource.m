






//
//  KLCalendarSource.m
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import "KLCalendarSource.h"
#import "NSDate+Extra.h"
#import "KLCalenderDateModel.h"

@interface KLCalendarSource ()

@property (nonatomic,  strong) NSDate *date;
@property (nonatomic,  copy) NSString *currentDataString;
@property (nonatomic, readonly, assign) NSInteger currentMonthTotalDay;
@property (nonatomic, readonly, assign) NSInteger theFirstDayTheWeek;
@property (nonatomic, readonly, assign) NSInteger previouslyMonthTotalDay;
@property (nonatomic, readonly, assign) NSInteger showTotalCount;

@end

@implementation KLCalendarSource

+ (KLCalendarSource *)calenderDataSourceWith:(NSDate *)date
{
    KLCalendarSource *dataSource =[[self alloc]init];
    dataSource.date = date;
    return  dataSource;
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    _currentMonthTotalDay = [self totalDayCurrentMonth];
    _theFirstDayTheWeek = [self dayOfTheWeekTheday];
    _previouslyMonthTotalDay = [self previouslyTotalDay];
    _showTotalCount = (_currentMonthTotalDay + _theFirstDayTheWeek) > 35 ? 42 : 35;
    
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    dateComponents.month = -1;
    NSDate *date1 = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    NSDateComponents *preComponents = [calender components:NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date1];
    
    NSDateComponents *currentComponents = [calender components:NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date];
    
    dateComponents.month = 1;
    date1 = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    NSDateComponents *nextComponents = [calender components:NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date1];
    
    for (int i = 0 ; i < _showTotalCount; i ++)
    {
        KLCalenderDateModel *model = [[KLCalenderDateModel alloc] init];
        if (_theFirstDayTheWeek > i) {
            model.dateString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",preComponents.year,preComponents.month,_previouslyMonthTotalDay - (_theFirstDayTheWeek - i) + 1];
            model.type = KLCalenderDateModelPrevious;
            model.showDate =  @(_previouslyMonthTotalDay - (_theFirstDayTheWeek - i) + 1).stringValue;
        }else
        {
            if (i - _theFirstDayTheWeek >= _currentMonthTotalDay)
            {
                model.showDate = @(i- _currentMonthTotalDay + 1 - _theFirstDayTheWeek).stringValue;
                model.dateString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",nextComponents.year,nextComponents.month,i-_currentMonthTotalDay + 1 - _theFirstDayTheWeek];
                model.type = KLCalenderDateModelNext;
                
            } else
            {
                
                
                model.dateString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",currentComponents.year,currentComponents.month,i + 1 - _theFirstDayTheWeek];
                model.type = KLCalenderDateModelCurrent;
                model.showDate =@(i + 1 - _theFirstDayTheWeek).stringValue;
            }
        }
        [dataArray addObject:model];
        _dataArray = dataArray;
    }
}

- (NSInteger)totalDayCurrentMonth
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSRange range = [calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.date];
    return  range.length;
}

- (NSInteger)dayOfTheWeekTheday
{
    NSCalendar *calendar =    [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth fromDate:self.date];
    _titleString = [NSString stringWithFormat:@"%ld年%ld月",components.year,components.month];
    [calendar setFirstWeekday:1];
    components.day = 1;
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:components];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (void)nextMonth
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    self.date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.date options:0];
}

- (NSInteger)previouslyTotalDay
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDate *date =[calender dateByAddingComponents:dateComponents toDate:self.date options:0];
    NSRange range = [calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return  range.length;
}



@end
