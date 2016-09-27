//
//  NewsCell.m
//  WXMovie85
//
//  Created by HJH on 4/16/16.
//  Copyright © 2016 . All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setModel:(NewsModel *)model
{
    _model = model;
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.summary;
    
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
    _typeImageView.image = [UIImage imageNamed:imageName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
