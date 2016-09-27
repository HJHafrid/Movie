//
//  SmallCollectionViewCell.h
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016  . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface SmallCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, strong) HomeModel *model;

@end
