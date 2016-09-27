//
//  PosterView.m
//  WXMovie85
//
//  Created by HJH on 4/23/16.
//  Copyright © 2016 . All rights reserved.
//

#import "PosterView.h"
#import "SmallLayout.h"
#import "LargeLayout.h"
#import "LargeCollectionView.h"
#import "SmallCollectionView.h"
#import "HomeModel.h"

@implementation PosterView
- (void)dealloc
{
    [_largeView removeObserver:_smallView forKeyPath:kCurrentIndex];
    [_smallView removeObserver:_largeView forKeyPath:kCurrentIndex];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _createUI];
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    
    _largeView.dataArray = _dataArray;
    _smallView.dataArray = _dataArray;
    [self changeTitleWithIndex:0];
}

- (void)_createUI
{
    self.backgroundColor = [UIColor clearColor];
    [self _createLargeView];
    [self _createLightView];

    [self _createHeaderView];

    [self _createFooterView];
    
    [_largeView addObserver:_smallView forKeyPath:kCurrentIndex options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    [_smallView addObserver:_largeView forKeyPath:kCurrentIndex options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    [_largeView addObserver:self forKeyPath:kCurrentIndex options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL ];

    [self _createMaskView];
    [self bringSubviewToFront:_headView];
    [self _creatGest];
}

- (void)_creatGest
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(maskAction)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipe];
}

- (void)_createMaskView
{
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49 - kFooterHeight)];
     maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskAction)];
 
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(maskAction)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [maskView addGestureRecognizer:swipe];
    
    [maskView addGestureRecognizer:tap];
    [self addSubview:maskView];
}

- (void)_createHeaderView
{
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];

    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    _headView = [[UIImageView alloc] initWithImage:image];
    _headView.userInteractionEnabled = YES;
    
    _headView.frame = CGRectMake(0, -kSmallHeight - 5 , kScreenWidth, kHeaderHeight);
    [self addSubview:_headView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - 26) / 2, kHeaderHeight - 20, 26, 20)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"]forState:UIControlStateSelected];
    button.tag = 1000;
    
    [_headView addSubview:button];
    
    MovieLayout *layout = [[SmallLayout alloc] init];
    _smallView = [[SmallCollectionView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, kSmallHeight) collectionViewLayout:layout];
    
    [_headView addSubview:_smallView];
}

- (void)_createLargeView
{
    MovieLayout *layout = [[LargeLayout alloc] init];
    _largeView = [[LargeCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49 - kFooterHeight) collectionViewLayout:layout];
    
    [self addSubview:_largeView];
}

- (void)_createLightView
{
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 124, 204)];
    leftView.image = [UIImage imageNamed:@"light"];
    
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 10 - 124, 5, 124, 204)];
    rightView.image = [UIImage imageNamed:@"light"];
    
    [self addSubview:rightView];
    [self addSubview:leftView];
}

- (void)maskAction
{
    UIButton *button = [_headView viewWithTag:1000];
    [self buttonAction:button];
}

- (void)buttonAction:(UIButton *)button
{
    button.selected = !button.selected;
    
    [UIView animateWithDuration:0.25 animations:^{
        _headView.top = button.selected ? 0 : ( - kSmallHeight - 5);
        maskView.alpha = button.selected ? 0.6 : 0;
    }];
}

- (void)_createFooterView
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49 - kFooterHeight - 64, kScreenWidth, kFooterHeight)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    _titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    [self addSubview:_titleLabel];
}

#pragma - mark KVO currentIndex
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSInteger index = [change[@"new"] integerValue];
    [self changeTitleWithIndex:index];
}

- (void)changeTitleWithIndex:(NSInteger )index
{
    HomeModel *model = _dataArray[index];
    _titleLabel.text = model.title;
}

@end
