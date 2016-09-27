//
//  CinemaModel.h
//  WXMovie
//
//  Created by HJH on 4/7/16.
//  Copyright © 2016 . All rights reserved.
//

#import "BaseModel.h"

@interface CinemaModel : BaseModel

@property(nonatomic, copy)NSString *lowPrice;
@property(nonatomic, copy)NSString *grade;
@property(nonatomic, copy)NSString *coord;
@property(nonatomic, copy)NSString *address;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *cinemaModelId;
@property(nonatomic, copy)NSString *districtId;
@property(nonatomic, copy)NSString *tel;
@property(nonatomic, copy)NSString *isSeatSupport;
@property(nonatomic, copy)NSString *isCouponSupport;
@property(nonatomic, copy)NSString *isImaxSupport;
@property(nonatomic, copy)NSString *isGroupBuySupport;
@property(nonatomic, copy)NSString *circleName;       

@end
