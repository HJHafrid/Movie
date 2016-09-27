//
//  WXTabBarButton.h
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016  . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
{
    UIImageView *imageView;
    UILabel *titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
                withImageName:(NSString *)imageName
                    withTitle:(NSString *)title;

@end
