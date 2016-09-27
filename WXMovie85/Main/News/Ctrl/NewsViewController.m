//
//  NewsViewController.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016  . All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    UIImageView *headerView;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";

    [self paraseData];

    [self configUI];
    
}

- (void)paraseData
{
    _dataArray = [NSMutableArray array];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:NULL];
    for (NSDictionary *dic in array) {
        NewsModel *model = [[NewsModel alloc] init];
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.newsid = [dic[@"newsid"] integerValue];
        model.image = dic[@"image"];
        model.type = (NewsType)[dic[@"type"] integerValue];
        
        [_dataArray addObject:model];
    }
}

- (void)configUI
{
    headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 200)];
    NewsModel *model = _dataArray[0];
    [headerView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [self.view insertSubview:headerView belowSubview:self.newsTableView];
    headerView.contentMode = UIViewContentModeScaleAspectFill;

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, view.bottom - 40, kScreenWidth, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.text = model.title;
    label.font = [UIFont boldSystemFontOfSize:23];
    label.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    view.backgroundColor = [UIColor clearColor];
    self.newsTableView.tableHeaderView = view;

    [_dataArray removeObjectAtIndex:0];
    [self.newsTableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCellID"];
    self.newsTableView.rowHeight = 120;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCellID" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
    
    CGFloat y = ofy + top;
    if (y >= 0) {
        headerView.frame = CGRectMake(0, -y + 64, kScreenWidth, 200);
    }else
    {
        CGFloat height = 200 - y;
        headerView.frame = CGRectMake(0, 64, kScreenWidth, height);
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcid = nil;
    switch (cell.model.type) {
        case WordType:
            vcid = @"NewsWordViewController";
            break;
         case ImageType:
            vcid = @"NewsImageViewController";
            break;
        default:
            break;
    }
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:vcid];
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
