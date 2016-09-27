//
//  NewsImageViewController.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "NewsImageViewController.h"
#import "NewsImageCell.h"
#import "PhotoViewController.h"


#define kItemWidth 120
#define kItemHeight 88
#define kItemCount 3

#define kItemSpace (kScreenWidth - kItemCount * kItemWidth) / (kItemCount + 8)
@interface NewsImageViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end

@implementation NewsImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _loadData];
    [self _configUI];
    
}

- (void)_loadData
{
    _dataArray = [NSMutableArray array];
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_list.json" ofType:nil]] options:NSJSONReadingMutableContainers error:NULL];
    
    for (NSDictionary *dic in array) {
        ImageModel *model = [[ImageModel alloc] init];
        
        model.imgaeId = [dic[@"id"] integerValue];
        model.image = dic[@"image"];
        model.type = [dic[@"type"] integerValue];
        
        [_dataArray addObject:model];
    }
}

- (void)_configUI
{
    self.flowLayout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    self.flowLayout.minimumLineSpacing = kItemSpace;
    self.flowLayout.minimumInteritemSpacing = kItemSpace;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(kItemSpace, kItemSpace, 0, kItemSpace);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewsImageCellID" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    vc.selectIndexPath = indexPath;
    NSMutableArray *array = [NSMutableArray array];
    for (ImageModel *model in _dataArray) {
        [array addObject:model.image];
    }
    
    vc.imageUrls = array;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
