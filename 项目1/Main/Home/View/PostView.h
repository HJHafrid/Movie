//
//  PostView.h
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCollectionView.h"
#define kHeaderHeight 130
#define kFooterHeight 30
#define kSmallHeight 100
@interface PostView : UIView
{
    UIImageView *_headView;
    UILabel *_titleLable;
    
    MovieCollectionView *_largeView;
    MovieCollectionView *_smallView;
}

@property (nonatomic, strong) NSArray *dataArray;


@end
