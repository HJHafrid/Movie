//
//  SmallCollectionViewCell.m
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "SmallCollectionViewCell.h"

@implementation SmallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setModel:(HomeModel *)model
{
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_model.images[@"small"]]];
}
@end
