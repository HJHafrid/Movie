//
//  NewsModel.h
//  WXMovie85
//
//  Created by wenyuan on 4/16/16.
//  Copyright © 2016 wenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    WordType,ImageType,VideoType
}NewsType;

@interface NewsModel : NSObject

@property (nonatomic, assign) NSInteger newsid;

@property (nonatomic, assign) NewsType type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *image;

@end
