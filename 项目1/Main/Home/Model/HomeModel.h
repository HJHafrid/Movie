//
//  HomeModel.h
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic, strong) NSDictionary *rating;
@property (nonatomic, strong) NSDictionary *images;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSDictionary *title;
@property (nonatomic, copy) NSDictionary *original_title;

@end
