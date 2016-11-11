//
//  UITextField+ZgyExtension.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/11.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "UITextField+ZgyExtension.h"

@implementation UITextField (ZgyExtension)
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    
    if (self.placeholder.length == 0) {
        self.placeholder = @" ";
        self.placeholder = nil;
    }

    // 恢复到默认颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
    
}
-(UIColor *)placeholderColor
{
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}
@end
