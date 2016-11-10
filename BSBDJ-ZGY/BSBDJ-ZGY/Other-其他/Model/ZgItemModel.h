//
//  ZgItemModel.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZgItemModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIImage *image;
+ (instancetype)zgItemWithTitle:(NSString *)title imageStr:(NSString *)imageStr;
@end
