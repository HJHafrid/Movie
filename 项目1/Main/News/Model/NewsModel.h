//
//  NewsModel.h
//  项目1
//
//  Created by 黄家辉 on 16/4/22.
//  Copyright © 2016年 黄家辉. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    WordType,ImageType, VideoType
}NewsType;
@interface NewsModel : NSObject
@property (nonatomic, assign) NSInteger newsid;
@property (nonatomic, assign) NewsType  type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *image;

@end
