//
//  HomeCell.h
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarView.h"
  
@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *oriTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (nonatomic, strong) HomeModel *model;
@property (weak, nonatomic) IBOutlet StarView *starView;


@end
