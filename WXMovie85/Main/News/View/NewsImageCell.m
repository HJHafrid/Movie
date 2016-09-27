//
//  NewsImageCell.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "NewsImageCell.h"

@implementation NewsImageCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)setModel:(ImageModel *)model
{
    _model = model;
    
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
}

@end
