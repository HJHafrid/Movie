//
//  SmallCollectionView.m
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016  . All rights reserved.
//

#import "SmallCollectionView.h"
#import "SmallCollectionViewCell.h"

@implementation SmallCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = 70;
        [self registerNib:[UINib nibWithNibName:@"SmallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SmallCellID"];
        
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SmallCellID" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}


@end
