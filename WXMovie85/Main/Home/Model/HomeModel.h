//
//  HomeModel.h
//  WXMovie85
//
//  Created by HJH on 4/10/16.
//  Copyright © 2016 . All rights reserved.
//

#import "BaseModel.h"

@interface HomeModel : BaseModel

@property (nonatomic, strong) NSDictionary *rating;

@property (nonatomic, strong) NSDictionary *images;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *original_title;

@end
