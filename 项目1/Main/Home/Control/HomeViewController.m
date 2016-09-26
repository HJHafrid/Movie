//
//  HomeViewController.m
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "PostView.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet PostView *postView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _postView.hidden = YES;
    [self _creatCustomView];
    //注册单元格
    [self.listTableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCellID"];
    [self _parseJsondata];
}
- (void)_parseJsondata
{
    _dataArray = [NSMutableArray array];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *subjects = result[@"subjects"];
    NSLog(@"%@", subjects);
    for (NSDictionary *dataDic in subjects) {
        NSDictionary *subject = dataDic[@"subject"];
        HomeModel *model = [[HomeModel alloc] init];
        model.rating = subject[@"rating"];
        model.year = subject[@"year"];
        model.title = subject[@"title"];
        model.original_title = subject[@"original_title"];
        model.images = subject[@"images"];
        
        [_dataArray addObject:model];
    }
    _postView.dataArray = _dataArray;
}
- (void)_creatCustomView
{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    customView.backgroundColor = [UIColor clearColor];
    UIButton *posterButton = [[UIButton alloc] initWithFrame:customView.frame];
    [posterButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [posterButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [posterButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:posterButton];
    
    UIButton *listButton = [[UIButton alloc] initWithFrame:customView.frame];
    [listButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [listButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:listButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
}
- (void)buttonAction:(UIButton *)sender
{
    //1.拿到customView
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    //2.改变试图层次
    [customView sendSubviewToBack:sender];
//    animationFlag = !animationFlag;
    UIViewAnimationTransition transition = _postView.hidden ?UIViewAnimationTransitionFlipFromLeft :UIViewAnimationTransitionFlipFromRight;
    _listTableView.hidden = _postView.hidden;
    _postView.hidden = !_listTableView.hidden;
    [UIView animateWithDuration:.25 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:customView cache:YES];
    }];[UIView animateWithDuration:.25 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
