//
//  PosterView.h
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCollectionView.h"

#define kHeaderHeight 130
#define kFooterHeight 30
#define kSmallHeight 100
@interface PosterView : UIView
{
    UIImageView *_headView;
    UILabel *_titleLabel;
    UIView *maskView;
    
    MovieCollectionView *_largeView;
    MovieCollectionView *_smallView;
}

@property (nonatomic, strong) NSArray *dataArray;

@end
