//
//  StarView.h
//  WXMovie85
//
//  Created by HJH on 4/10/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_yellow;
    UIView *_gray;
}

- (void)changeStarWithRating:(float )rating;

@end
