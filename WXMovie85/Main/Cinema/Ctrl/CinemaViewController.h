//
//  CinemaViewController.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *districtArr;

    NSMutableDictionary *cinemaDic;
}



@end
