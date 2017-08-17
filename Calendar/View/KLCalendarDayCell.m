//
//  KLCalendarDayCell.m
//  Calendar
//
//  Created by user on 17/8/16.
//  Copyright © 2017年 user. All rights reserved.
//

#import "KLCalendarDayCell.h"

@implementation KLCalendarDayCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setModel:(KLCalenderDateModel *)model
{
    self.dateLabel.text = model.showDate;
}

@end
