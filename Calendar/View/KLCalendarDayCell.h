//
//  KLCalendarDayCell.h
//  Calendar
//
//  Created by user on 17/8/16.
//  Copyright © 2017年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLCalenderDateModel.h"
@interface KLCalendarDayCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) KLCalenderDateModel *model;

@end
