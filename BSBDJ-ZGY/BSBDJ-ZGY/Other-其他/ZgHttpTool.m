//
//  ZgHttpTool.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/14.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "ZgHttpTool.h"
#import <AFNetworking.h>
@implementation ZgHttpTool

+ (void)toolWith:(ZgHttpMethod)method param:(NSDictionary *)param url:(NSString *)url success:(ZgSuccess)success failure:(ZgFailure)failure{    
    switch (method) {
        case ZgGet:
        {
            [[AFHTTPSessionManager manager]GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    failure(error.localizedDescription);
                }
            }];

        }
            break;
        case ZgPost:
        {
            [[AFHTTPSessionManager manager]POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    failure(error.localizedDescription);
                }
            }];
        }
            break;
        case ZgPut:
        {
            [[AFHTTPSessionManager manager]PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    failure(error.localizedDescription);
                }

            }];
        }
            break;
        case ZgDelete:
        {
            [[AFHTTPSessionManager manager]DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error) {
                    failure(error.localizedDescription);
                }

            }];
        }
            break;
        default:
            break;
    }
}

@end
