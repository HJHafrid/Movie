//
//  LargeCollectionView.m
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "LargeCollectionView.h"
#import "LargeCollectionViewCell.h"
@implementation LargeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = kScreenWidth - 100;
        //注册单元格
        [self registerNib:[UINib nibWithNibName:@"LargeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LargeCellID"];
    }
    return self;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LargeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LargeCellID" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(self.itemWidth, self.height);
}

@end
