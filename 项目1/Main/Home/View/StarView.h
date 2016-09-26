//
//  StarView.h
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_yellow;
    UIView *_gray;
}
- (void)changeStarWithRating:(float)rating;
@end
