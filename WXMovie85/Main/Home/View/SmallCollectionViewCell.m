//
//  SmallCollectionViewCell.m
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016  . All rights reserved.
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
