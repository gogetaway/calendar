//
//  KLMonthCollectionCell.h
//  Calendar
//
//  Created by user on 17/8/16.
//  Copyright © 2017年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLCalendarSource.h"
#import <Masonry.h>

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width

@interface KLMonthCollectionCell : UICollectionViewCell

@property (nonatomic, strong)KLCalendarSource *dataSource;


@end
