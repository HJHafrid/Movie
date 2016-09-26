//
//  NewsViewController.m
//  项目1
//
//  Created by 黄家辉 on 16/4/9.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewsWordViewController.h"
@interface NewsViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UIImageView *headView;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
//            NSLog(@"%@", model.image);
    }
    NSLog(@"%@", _dataArray);

}
- (void)configUI
{
    headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 200)];
    NewsModel *model = _dataArray[0];
    [headView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    [self.view insertSubview:headView belowSubview:self.newsTableView];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    view.backgroundColor = [UIColor clearColor];
    self.newsTableView.tableHeaderView = view;
    //移除
    [_dataArray removeObjectAtIndex:0];
    [self.newsTableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"NewsCellID"];
    self.newsTableView.rowHeight = 100;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCellID" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算显示的头视图
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
    //    scrollView.contentInset
    
    CGFloat y = ofy + top;
    if (y >= 0) {
        headView.frame = CGRectMake(0, -y + 64, kScreenWidth, 200);
    }else
    {
        CGFloat height = 200 - y;
        //        CGFloat width
        headView.frame = CGRectMake(0, 64, kScreenWidth, height);
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcid = nil;
    switch (cell.model.type) {
        case WordType:
            vcid = @"NewsWordViewController";
//            NewsWordViewController *word = [[NewsWordViewController alloc] init];
    
            break;
            
        default:
            break;
    }
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:vcid];
    [self.navigationController pushViewController:vc animated:YES];
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
