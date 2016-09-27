//
//  StarView.m
//  WXMovie85
//
//  Created by HJH on 4/10/16.
//  Copyright © 2016 . All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self _createSubviews];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _createSubviews];
    self.backgroundColor = [UIColor clearColor];
}

- (void)_createSubviews
{
    _yellow = [[UIView alloc] init];
    _gray = [[UIView alloc] init];
    
    [self addSubview:_gray];
    [self addSubview:_yellow];

    UIImage *image = [UIImage imageNamed:@"yellow"];
    float scale = self.height / (image.size.height + 0.5);

    _gray.transform = CGAffineTransformMakeScale(scale, scale);
    _yellow.transform = CGAffineTransformMakeScale(scale, scale);
    _gray.frame = CGRectMake(0, 0, 5 * self.height, self.height);
   
    _yellow.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow"]];
    _gray.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
}

- (void)changeStarWithRating:(float)rating
{
    _yellow.frame = CGRectMake(0, 0, 5 * self.height * rating / 10, self.height);
}

@end
