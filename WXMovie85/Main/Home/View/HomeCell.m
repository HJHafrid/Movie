//
//  HomeCell.m
//  WXMovie85
//
//  Created by HJH on 4/10/16.
//  Copyright © 2016 . All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setModel:(HomeModel *)model
{
    _model = model;
    
    self.titleLabel.text = _model.title;
    self.oriTitleLabel.text = _model.original_title;
    self.yearLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f", [_model.rating[@"average"] floatValue]];
    
    NSString *imageUrl = _model.images[@"medium"];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
    [_starView changeStarWithRating:[self.ratingLabel.text floatValue]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
