//
//  RootTabBarController.m
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "RootTabBarController.h"
#import "WXTabBarButton.h"
@interface RootTabBarController ()
{
    UIImageView *_selectImageView;
}

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createViewControllers];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self _creatTabBarButton];
}
- (void)viewWillAppear:(BOOL)animated
{
    //UITabBarButton 系统当中狂架的私有类，外部不能访问
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}
- (void)_createViewControllers
{

    NSArray *arrayName = @[@"Home", @"News", @"Top", @"Cinema", @"More"];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *name in arrayName) {
        //1.获取所有storyBoard
        UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
        //2.获取对应的viewController
        UIViewController *ViewCtrl = [sb instantiateInitialViewController];
        //3.传给viewControllers
        [viewControllers addObject:ViewCtrl];
    }
    self.viewControllers = viewControllers;
}
//恢复状态栏

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//自定义图标TabBarButton
- (void)_creatTabBarButton
{
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / 5;
    _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
    _selectImageView.frame = CGRectMake(0, 2, 50, 45);
    [self.tabBar addSubview:_selectImageView];
    NSArray *nameArray = @[@"首页", @"新闻", @"Top", @"影院", @"更多"];
    NSArray *imageArray = @[
                            @"movie_home",
                            @"msg_new",
                            @"start_top250",
                            @"icon_cinema",
                            @"more_setting"
                            ];
    for (int i = 0; i < nameArray.count; i++) {
        NSString *title = nameArray[i];
        NSString *imageName = imageArray[i];

        WXTabBarButton *button = [[WXTabBarButton alloc] initWithFrame:CGRectMake(i *itemWidth, 0, itemWidth, 49) withImageName:imageName withTitle:title];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [self.tabBar addSubview:button];
    }
    _selectImageView.center = [self.tabBar viewWithTag:100].center;
    
}
- (void)buttonAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 100;
    [UIView animateWithDuration:.25 animations:^{
        _selectImageView.center = sender.center;
    }];
//    if (sender.tag == 100) {
//        _selectImageView.center = self.tabBar.center;
//    }
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
