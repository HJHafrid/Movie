//
//  NewsCell.m
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(NewsModel *)model
{
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
//    NSLog(@"%@", [NSURL URLWithString:_model.image]);
    _titleLable.text = _model.title;
    _summaryLable.text = _model.summary;
    NSString *imageName = nil;
    switch (_model.type) {
        case WordType:
            imageName = @"word";
            break;
        case ImageType:
            imageName = @"sctpxw";
            break;
        case VideoType:
            imageName = @"scspxw";
            break;
            
        default:
            break;
    }
    _typrImageView.image = [UIImage imageNamed:imageName];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
