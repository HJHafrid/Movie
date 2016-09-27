//
//  TopDetailModel.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import "BaseModel.h"

@interface TopDetailModel : BaseModel

@property (nonatomic,copy)NSString *image;
@property (nonatomic,copy)NSString *titleCn;
@property (nonatomic,copy)NSString *titleEn;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,strong)NSArray *videos;

@end
