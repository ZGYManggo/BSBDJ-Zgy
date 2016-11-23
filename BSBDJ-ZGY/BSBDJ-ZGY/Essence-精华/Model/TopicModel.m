//
//  TopicModel.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/23.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
            @"top_cmt" : @"top_cmt[0]",
            @"small_image" : @"image0",
            @"middle_image" : @"image2",
            @"large_image" : @"image1",
            @"ID" : @"id"
             };
}
@end
