//
//  KLMonthCollectionCell.m
//  Calendar
//
//  Created by user on 17/8/16.
//  Copyright © 2017年 user. All rights reserved.
//

#import "KLMonthCollectionCell.h"
#import "KLCalendarDayCell.h"
#import "KLCalenderDateModel.h"
@interface KLMonthCollectionCell ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation KLMonthCollectionCell

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
      //  [_collectionView registerClass:[KLCalendarDayCell class] forCellWithReuseIdentifier:@"KLCalendarDayCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"KLCalendarDayCell" bundle:nil] forCellWithReuseIdentifier:@"KLCalendarDayCell"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self intializedView];
    }
    return self;
}

- (void)intializedView
{
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
}

- (void)setDataSource:(KLCalendarSource *)dataSource
{
    _dataSource = dataSource;
    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KLCalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KLCalendarDayCell" forIndexPath:indexPath];
    KLCalenderDateModel *model = self.dataSource.dataArray[indexPath.row];
    cell.model = model;
       return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.dataSource.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth / 7, ScreenWidth / 7);
}

@end
