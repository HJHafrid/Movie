//
//  NewsImageCell.h
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

@interface NewsImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic, strong) ImageModel *model;
@end
