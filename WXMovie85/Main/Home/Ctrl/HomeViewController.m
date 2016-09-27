//
//  HomeViewController.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016 . All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "PosterView.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet PosterView *posterView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _posterView.hidden = YES;
    [self _createCunstomView];

    [self _parseJsonData];
    
//注册单元格
    [self.listTableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCellID"];
}

- (void)_parseJsonData
{
    _dataArray = [NSMutableArray array];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];

    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = result[@"subjects"];
    
    for (NSDictionary *dataDic in subjects) {
        NSDictionary *subject = dataDic[@"subject"];
        HomeModel *model = [[HomeModel alloc] initWithDictionary:subject];
        [_dataArray addObject:model];
    }
    _posterView.dataArray = _dataArray;
}

- (void)_createCunstomView
{
    UIView *custonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    custonView.backgroundColor = [UIColor clearColor];
    
    UIButton *posterButton = [[UIButton alloc] initWithFrame:custonView.frame];
    [posterButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [posterButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [posterButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [custonView addSubview:posterButton];
    
    UIButton *listButton = [[UIButton alloc] initWithFrame:custonView.frame];
    [listButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [listButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [custonView addSubview:listButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:custonView];
}

- (void)buttonAction:(UIButton *)sender
{

    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    [customView sendSubviewToBack:sender];
    UIViewAnimationTransition transition = _posterView.hidden ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight;
    _listTableView.hidden = _posterView.hidden;
    _posterView.hidden = !_listTableView.hidden;

    [UIView animateWithDuration:.25 animations:^{
        [UIView setAnimationTransition:transition forView:customView cache:YES];
    }];
    
    [UIView animateWithDuration:.25 animations:^{
        [UIView setAnimationTransition:transition forView:self.view cache:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark tableview datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCellID" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

@end
