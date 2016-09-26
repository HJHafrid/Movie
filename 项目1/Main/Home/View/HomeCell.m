//
//  HomeCell.m
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(HomeModel *)model
{
    _model = model;
    self.titleLable.text = _model.title;
    self.oriTitleLable.text = _model.original_title;
    self.yearLable.text = [NSString stringWithFormat:@"年份:%@", _model.year];
    self.ratingLable.text = [NSString stringWithFormat:@"%.1f", [_model.rating[@"average"] floatValue]];
    NSString *imageUrl = _model.images[@"medium"];
//    if ([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]) {
//                   self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
//            }
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
    [_starView changeStarWithRating:[self.ratingLable.text floatValue]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
