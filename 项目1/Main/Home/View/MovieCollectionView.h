//
//  MovieCollectionView.h
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) CGFloat itemWidth;

@end
