//
//  NewsCell.h
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
@property (nonatomic, strong) NewsModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UIImageView *typrImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLable;

@end
