//
//  BaseModel.m
//  WXMovie85
//
//  Created by HJH on 5/8/16.
//  Copyright © 2016  . All rights reserved.
//

#import "BaseModel.h"


@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self buildRelationship:dic];
    }
    
    return self;
}

- (void)buildRelationship:(NSDictionary *)dic
{
    NSArray *allKeys = [dic allKeys];
    for (NSString *key in allKeys) {

        NSString *setKey = [self changeKeyToSetKey:key];
        SEL method = [self changeSetKeyToSelector:setKey];
        id value = dic[key];
        if ([self respondsToSelector:method]) {
            [self performSelector:method withObject:value];
        }
        
    }
}

- (NSString *)changeKeyToSetKey:(NSString *)key
{
    NSString *keyStep1 = [[key substringToIndex:1] uppercaseString];
    NSString *keyStep2 = [key substringFromIndex:1];
    NSString *keyStep3 = nil;
    if ([key isEqualToString:@"id"]) {
        keyStep3 = [NSString stringWithFormat:@"set%@%@%@:", NSStringFromClass([self class]),keyStep1,keyStep2];
    }else
    {
        keyStep3 = [NSString stringWithFormat:@"set%@%@:",keyStep1,keyStep2];
    }
  
    return keyStep3;
}

- (SEL)changeSetKeyToSelector:(NSString *)setKey
{

    return NSSelectorFromString(setKey);
}

@end
