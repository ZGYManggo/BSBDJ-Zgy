//
//  UIBarButtonItem+ZgyExtension.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/11.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "UIBarButtonItem+ZgyExtension.h"

@implementation UIBarButtonItem (ZgyExtension)
+(instancetype)itemWithImage:(NSString *)image HeightImage:(NSString *)heightImage Target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
