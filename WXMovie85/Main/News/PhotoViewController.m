//
//  PhotoViewController.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoView.h"
#import "PhotoCell.h"
#import "PhotoLayout.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _configUI];
}

- (void)_configUI
{
    PhotoLayout *layout = [[PhotoLayout alloc] init];
    PhotoView *view = [[PhotoView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    view.dataArray = self.imageUrls;
    [self.view addSubview:view];
    [view scrollToItemAtIndexPath:_selectIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                         animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
