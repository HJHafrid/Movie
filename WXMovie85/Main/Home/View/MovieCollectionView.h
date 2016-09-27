//
//  MovieCollectionView.h
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCurrentIndex @"currentIndex"
@interface MovieCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) CGFloat itemWidth;

@property (nonatomic, assign) NSInteger currentIndex;

@end
