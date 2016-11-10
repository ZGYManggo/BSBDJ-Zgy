//
//  UIColor+ZgyExtension.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/9.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "UIColor+ZgyExtension.h"

@implementation UIColor (ZgyExtension)
+ (UIColor *)colorWithr:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}
+ (UIColor *)grayColorWithRGB:(CGFloat)rgb a:(CGFloat)a{
    return [self colorWithr:rgb g:rgb b:rgb a:a];
}
@end
