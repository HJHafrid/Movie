//
//  WXTabBarButton.m
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "WXTabBarButton.h"
#define kItemSize 20
@implementation WXTabBarButton
- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - kItemSize) / 2, 5, kItemSize, kItemSize)];
        imageView.image = [UIImage imageNamed:imageName];
        //按比例缩放
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        //系统方法CGRectGetMaxYimageView的底部
        lable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 5, frame.size.width , 15)];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.text = title;
        lable.font = [UIFont systemFontOfSize:14];
        lable.backgroundColor = [UIColor clearColor];
        [self addSubview:lable];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
