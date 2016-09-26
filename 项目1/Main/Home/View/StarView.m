//
//  StarView.m
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
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
-(void)changeStarWithRating:(float)rating
{
    _yellow.frame = CGRectMake(0, 0, 5 * self.height * rating / 10, self.height);
}
@end
