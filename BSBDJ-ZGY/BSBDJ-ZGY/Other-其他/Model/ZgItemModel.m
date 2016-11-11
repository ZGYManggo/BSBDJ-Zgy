//
//  ZgItemModel.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "ZgItemModel.h"

@implementation ZgItemModel

+ (instancetype)zgItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr{
    ZgItemModel *model = [[ZgItemModel alloc]init];
    model.title = title;
    model.image = [UIImage imageNamed:imageStr];
    return model;
}
+ (instancetype)zgItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr heightImage:(NSString *)heightImageStr{
    
    ZgItemModel *model = [self zgItemWithTitle:title imageStr:imageStr];
    model.heightImage = [UIImage imageNamed:imageStr];
    return model;
}

@end
