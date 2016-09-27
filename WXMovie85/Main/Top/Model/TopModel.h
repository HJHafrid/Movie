//
//  TopModel.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject

@property(nonatomic, strong)NSDictionary *rating;   
@property(nonatomic, strong)NSDictionary *images;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *year;


@end
