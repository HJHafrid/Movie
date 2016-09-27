//
//  RootTabBarController.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016  . All rights reserved.
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
    

    [self _creatViewControllers];
    
    [self _createTabBar];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
}

- (void)_creatViewControllers
{

    NSArray *nameArray = @[@"Home", @"News", @"Top", @"Cinema", @"More"];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSString *name in nameArray) {

        UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];

        UIViewController *viewCtrl = [sb instantiateInitialViewController];

        [viewControllers addObject:viewCtrl];
    }
    
    self.viewControllers = viewControllers;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }

}

- (void)_createTabBar
{
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / 5;
    
    _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
    
    _selectImageView.frame = CGRectMake(0, 2, 50, 45);
    [self.tabBar addSubview:_selectImageView];
    
        //2、添加自己的button
    NSArray *nameArray = @[@"首页", @"新闻", @"TOP", @"影院", @"更多"];
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
        
        WXTabBarButton *button = [[WXTabBarButton alloc] initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, 49) withImageName:imageName withTitle:title];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [self.tabBar addSubview:button];
    }
    
    //3、优化选择视图的位置
    _selectImageView.center = [self.tabBar viewWithTag:100].center;
}

- (void)buttonAction:(UIButton *)sender
{
    self.selectedIndex = sender.tag - 100;
    
    [UIView animateWithDuration:.25 animations:^{
        _selectImageView.center = sender.center;
    }];
    
    if (sender.tag == 100) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
