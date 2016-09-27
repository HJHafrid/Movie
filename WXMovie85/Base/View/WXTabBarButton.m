//
//  WXTabBarButton.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016  . All rights reserved.
//

#import "WXTabBarButton.h"

#define kItemSize 20

@implementation WXTabBarButton

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - kItemSize ) / 2, 5, kItemSize, kItemSize)];
        imageView.image = [UIImage imageNamed:imageName];

        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 5, frame.size.width, 15)];
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:titleLabel];
    }
    
    return self;
}



@end
