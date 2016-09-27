//
//  BaseNavigationController.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016  . All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];

    NSDictionary *dic = @{
                          NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                          NSForegroundColorAttributeName : [UIColor whiteColor]
                          };
    
    self.navigationBar.titleTextAttributes = dic;
}
//设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
