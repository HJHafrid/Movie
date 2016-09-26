//
//  PostView.m
//  项目1
//
//  Created by 黄家辉 on 16/5/4.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import "PostView.h"
#import "SmallLayout.h"
#import "LargeLayout.h"
#import "LargeCollectionView.h"
#import "SmallCollectionView.h"
@implementation PostView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createUI];
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self _createUI];
}
-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    _largeView.dataArray = _dataArray;
    _smallView.dataArray= _dataArray;
}
- (void)_createUI
{
    self.backgroundColor = [UIColor clearColor];
    [self _createLargeView];
//    [self _createSmallView];
    [self _createLightView];
    [self _createHeaderView];
    [self _createFooterView];
}
- (void)_createLargeView
{
    MovieLayout *layout = [[LargeLayout alloc] init];
    _largeView = [[LargeCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49 - kFooterHeight) collectionViewLayout:layout];
    [self addSubview:_largeView];
}
//- (void)_createSmallView
//{
//    MovieLayout *layout = [[SmallLayout alloc] init];
//    _smallView = [[SmallCollectionView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, kSmallHeight) collectionViewLayout:layout];
//    [_headView addSubview:_smallView];
//}
- (void)_createLightView
{
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 124, 204)];
    leftView.image = [UIImage imageNamed:@"light"];
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 10 - 124, 5, 124, 204)];
    rightView.image = [UIImage imageNamed:@"light"];
    [self addSubview:leftView];
    [self addSubview:rightView];
    
}
- (void)_createHeaderView
{ 
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    _headView = [[UIImageView alloc] initWithImage:image];
    _headView.userInteractionEnabled = YES;
    _headView.frame = CGRectMake(0, -kSmallHeight, kScreenWidth, kHeaderHeight);
    [self addSubview:_headView];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 26) / 2, kHeaderHeight - 20, 13, 10)];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1000;
    [_headView addSubview:button];
    
    MovieLayout *layout = [[SmallLayout alloc]init];
    _smallView = [[SmallCollectionView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, kSmallHeight) collectionViewLayout:layout];
    [_headView addSubview:_smallView];
    
}
- (void)buttonAction:(UIButton *)button
{
    button.selected = !button.selected;
    [UIView animateWithDuration:.25 animations:^{
        _headView.top = button.selected ? 0 : (- kSmallHeight - 5);
    }];
}
- (void)_createFooterView
{
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight - 64 - 49 - kFooterHeight, kScreenWidth, kFooterHeight)];
    _titleLable.text = @"11";
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.font = [UIFont systemFontOfSize:20];
    _titleLable.textColor = [UIColor blueColor];
    _titleLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    [self addSubview:_titleLable];
    
}

@end
