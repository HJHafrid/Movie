//
//  TopCollectionViewCell.m
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import "TopCollectionViewCell.h"

#define kStartHeight 13.0

@implementation TopCollectionViewCell

-(void)awakeFromNib
{
    titleLabel.alpha = 0.7;
    
    float y = kItemHeight - titleLabel.height + (titleLabel.height - kStartHeight ) / 2;
    starView = [[StarView alloc] initWithFrame:CGRectMake(0, y, kStartHeight*5, kStartHeight)];
    [self.contentView addSubview:starView];
}

-(void)setModel:(TopModel *)model
{
    _model = model;
    NSString *imgStr = [_model.images objectForKey:@"medium"];
    [imgView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    titleLabel.text = _model.title;

    NSNumber *ratingNum = [_model.rating objectForKey:@"average"];
    scoreLabel.text = [NSString stringWithFormat:@"%.1f", [ratingNum floatValue]];
    [starView changeStarWithRating:[ratingNum floatValue]];
}

@end
