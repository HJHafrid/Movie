//
//  PhotoView.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "PhotoView.h"
#import "PhotoCell.h"

@implementation PhotoView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.pagingEnabled = YES;
        
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"PhotoCellID"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCellID" forIndexPath:indexPath];
    cell.imageUrl = _dataArray[indexPath.row];
    
    return cell;
}
@end
