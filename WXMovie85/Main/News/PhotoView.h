//
//  PhotoView.h
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end
