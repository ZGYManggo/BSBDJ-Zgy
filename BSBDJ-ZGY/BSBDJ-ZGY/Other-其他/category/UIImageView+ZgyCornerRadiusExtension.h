//
//  UIImageView+ZgyCornerRadiusExtension.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/24.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZgyCornerRadiusExtension)
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)zg_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)zg_cornerRadiusRoundingRect;

- (void)zg_attachBorderWidth:(CGFloat)width color:(UIColor *)color;
@end
