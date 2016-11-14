//
//  ZgHttpTool.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/14.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ZgHttpMethod){
    ZgGet = 0,
    ZgPost,
    ZgPut,
    ZgDelete
};

typedef void (^ZgSuccess)(id obj);
typedef void (^ZgFailure)(NSString * errMsg);
@interface ZgHttpTool : NSObject

+ (void)toolWith:(ZgHttpMethod)method param:(NSDictionary *)param url:(NSString *)url success:(ZgSuccess)success failure:(ZgFailure)failure;

@end
