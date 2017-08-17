//
//  KLCalendarManager.m
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import "KLCalendarManager.h"
#import "KLCalendarSource.h"
@interface KLCalendarManager ()

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation KLCalendarManager

static KLCalendarManager *manager;
+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init ];
    });
    return manager;
}


- (NSArray *)calenderArrayDataSource
{
    self.date = [NSDate date];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    KLCalendarSource *dataSource1 = [KLCalendarSource calenderDataSourceWith:date];
    [array addObject:dataSource1];
    dateComponents.month = 1;
    date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    KLCalendarSource *dataSource2 = [KLCalendarSource calenderDataSourceWith:[NSDate date]];
    [array addObject:dataSource2];
    KLCalendarSource *dataSource3 = [KLCalendarSource calenderDataSourceWith:date];
    [array addObject:dataSource3];
    self.array = array;
    return array;
}

- (void)transitionToNextMonth
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = 1;
    self.date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.date options:0];
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.date options:0];
    
    [self.array removeObjectAtIndex:0];
    KLCalendarSource *dataSource4 = [KLCalendarSource calenderDataSourceWith:date];
    [self.array addObject:dataSource4];
    
}

- (void)transitionToPreviouslyMonth
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    self.date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.date options:0];
    [self.array removeLastObject];
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self.date options:0];
    KLCalendarSource *dataSource4 = [KLCalendarSource calenderDataSourceWith:date];
    [self.array insertObject:dataSource4 atIndex:0];
    
}

@end
