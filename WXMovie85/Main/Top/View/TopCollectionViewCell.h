//
//  TopCollectionViewCell.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"
#import "StarView.h"

#define kItemCount  3
#define kItemWidth  100
#define kItemHeight 166     

@interface TopCollectionViewCell : UICollectionViewCell
{
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *scoreLabel;
    
    StarView *starView;
}

@property(nonatomic, strong)TopModel *model;

@end
