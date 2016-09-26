//
//  SmallCollectionView.m
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "SmallCollectionView.h"
#import "SmallCollectionViewCell.h"
@implementation SmallCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = 70;
        //注册单元格
        [self registerNib:[UINib nibWithNibName:@"SmallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SmallCellID"];
    }
    return self;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SmallCellID" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, <#CGFloat left#>, 0, <#CGFloat right#>)
//}



@end
