//
//  NewsWordViewController.m
//  WXMovie85
//
//  Created by HJH on 4/16/16.
//  Copyright © 2016  . All rights reserved.
//

#import "NewsWordViewController.h"

@interface NewsWordViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NewsWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
