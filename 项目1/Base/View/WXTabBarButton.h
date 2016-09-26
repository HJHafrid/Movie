//
//  WXTabBarButton.h
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarButton : UIControl
{
    UIImageView *imageView;
    UILabel *lable;
}
- (instancetype)initWithFrame:(CGRect)frame
                withImageName:(NSString *)imageName
                    withTitle:(NSString *)title;
@end
