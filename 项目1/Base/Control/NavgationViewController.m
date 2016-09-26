//
//  NavgationViewController.m
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "NavgationViewController.h"

@interface NavgationViewController ()

@end

@implementation NavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    //属性字典
    NSDictionary *dic = @{
                          NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                          NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationBar.titleTextAttributes = dic;
}
//恢复状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
