//
//  PhotoLayout.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "PhotoLayout.h"

@implementation PhotoLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
        self.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    }
    return self;
}

@end
