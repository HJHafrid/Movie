//
//  NewsCell.h
//  WXMovie85
//
//  Created by HJH on 4/16/16.
//  Copyright © 2016  . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property (nonatomic, strong) NewsModel *model;

@end
