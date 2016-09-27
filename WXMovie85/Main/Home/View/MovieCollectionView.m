//
//  MovieCollectionView.m
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016 . All rights reserved.
//

#import "MovieCollectionView.h"

@implementation MovieCollectionView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
#pragma - mark flow Layout delegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth, self.height);
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{

    CGFloat offsetX = targetContentOffset->x;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    CGFloat space = layout.minimumLineSpacing;

    CGFloat pageWidth = _itemWidth + space;
    NSInteger pageNum = (offsetX + pageWidth / 2) / pageWidth;
    NSLog(@"%ld ", pageNum);
    pageNum = velocity.x == 0 ? pageNum : (velocity.x > 0 ? pageNum + 1 : pageNum - 1);
    pageNum = MIN((MAX(pageNum, 0)), self.dataArray.count - 1);
    targetContentOffset->x = pageNum * pageWidth;
    self.currentIndex = pageNum;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentIndex != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }

}

#pragma - mark KVO currentIndex
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSInteger index = [change[@"new"] integerValue];

    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = index;
    }
    
}
@end
