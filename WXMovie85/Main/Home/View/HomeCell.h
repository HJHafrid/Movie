//
//  HomeCell.h
//  WXMovie85
//
//  Created by HJH on 4/10/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarView.h"

@interface HomeCell : UITableViewCell

@property (nonatomic, strong) HomeModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oriTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet StarView *starView;



@end
