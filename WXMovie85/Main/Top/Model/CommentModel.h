//
//  CommentModel.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import "BaseModel.h"
@interface CommentModel : BaseModel

@property(nonatomic, copy)NSString* userImage;
@property(nonatomic, copy)NSString* nickname;
@property(nonatomic, copy)NSString* rating;
@property(nonatomic, copy)NSString* content;

@end
