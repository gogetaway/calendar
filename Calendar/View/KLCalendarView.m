//




//  KLCalendarView.m
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import "KLCalendarView.h"
#import "KLCalendarManager.h"
#import "KLCalendarSource.h"
#import "KLMonthCollectionCell.h"
#import <Masonry.h>


@interface KLCalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) KLCalendarManager *calenderManager;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation KLCalendarView

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.pagingEnabled=  YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[KLMonthCollectionCell class] forCellWithReuseIdentifier:@"KLMonthCollectionCell"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.calenderManager = [KLCalendarManager shareManager];
        self.dataArray = [self.calenderManager calenderArrayDataSource];
     
        UIView *topView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.height.equalTo(@80);
        }];
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.dateLabel.font = [UIFont systemFontOfSize:20];
        self.dateLabel.text  = [self.dataArray[1] titleString];
        [topView addSubview:self.dateLabel];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.top.equalTo(@5);
            make.height.equalTo(@30);
        }];

        
        NSArray *weekArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        for (int i = 0;  i < weekArray.count; i ++)
        {
            UILabel *weekLabel = [[UILabel alloc] init];
            weekLabel.textAlignment = NSTextAlignmentCenter;
            weekLabel.text = weekArray[i];
            weekLabel.textColor = [UIColor redColor];
            weekLabel.frame = CGRectMake(ScreenWidth / 7 * i, 40, ScreenWidth/7, 25);
            [topView addSubview:weekLabel];
        }
        
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topView.mas_bottom);
            make.left.right.equalTo(@0);
            make.height.equalTo(@(ScreenWidth / 7 *6));
        }];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KLMonthCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KLMonthCollectionCell" forIndexPath:indexPath];
    cell.dataSource = self.dataArray[indexPath.row];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, ScreenWidth / 7 *6);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x /[UIScreen mainScreen].bounds.size.width  == 1)
    {
        return;
    }
    
    if (scrollView.contentOffset.x /[UIScreen mainScreen].bounds.size.width  > 1)
    {
        [self.calenderManager transitionToNextMonth];
    } else
    {
        [self.calenderManager transitionToPreviouslyMonth];
    }
    [self.collectionView reloadData];
    self.dateLabel.text  = [self.dataArray[1] titleString];
    [self.collectionView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.collectionView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)];
    
}

@end
