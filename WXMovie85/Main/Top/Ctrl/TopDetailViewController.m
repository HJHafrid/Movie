//
//  TopDetailViewController.m
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopDetailCell.h"
#import "TopDetailHeaderView.h"

#define kTableViewRowHeight 80

@interface TopDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tbView;
@property(nonatomic, strong)NSMutableArray *commentArr;
@property(nonatomic, strong)NSIndexPath *selectIndexPath;

@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    NSDictionary *detailDic = [WXDataService requestDataWithJsonFile:@"movie_detail.json"];
    TopDetailModel *detailModel = [[TopDetailModel alloc] initWithDictionary:detailDic];
    headerView.model = detailModel;

    _commentArr = [NSMutableArray array];
    NSDictionary *cmmtDic = [WXDataService requestDataWithJsonFile:@"movie_comment.json"];
    NSArray *listArr = cmmtDic[@"list"];
    for (NSDictionary *dic in listArr) {
        CommentModel *model = [[CommentModel alloc] initWithDictionary:dic];
        [_commentArr addObject:model];
    }
}

-(void)viewDidLayoutSubviews
{
    
}

-(void)createUI
{
    headerView = [[[NSBundle mainBundle] loadNibNamed:@"TopDetailHeaderView" owner:self options:nil] firstObject];
    self.tbView.tableHeaderView = headerView;
    self.tbView.separatorColor = kTableViewSeColor;
    [self.tbView registerNib:[UINib nibWithNibName:@"TopDetailCell" bundle:nil] forCellReuseIdentifier:@"kTopDetailCellID"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kTopDetailCellID" forIndexPath:indexPath];
    
    cell.commentModel = self.commentArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectIndexPath isEqual:indexPath]) {

        CommentModel *model = self.commentArr[indexPath.row];
        
        NSDictionary *arrtDic = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        CGRect frame = [model.content
                        boundingRectWithSize:CGSizeMake(kScreenWidth-114, 2000)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:arrtDic
                        context:nil];
        CGFloat height = MAX(frame.size.height + 49 + 10 , kTableViewRowHeight);
        return height;
    }else{
        return kTableViewRowHeight;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![_selectIndexPath isEqual:indexPath]) {
        self.selectIndexPath = indexPath;

        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
