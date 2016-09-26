//
//  SmallCollectionViewCell.h
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface SmallCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) HomeModel *model;
@end
