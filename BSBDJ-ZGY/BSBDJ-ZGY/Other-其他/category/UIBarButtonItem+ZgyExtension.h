//
//  UIBarButtonItem+ZgyExtension.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/11.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZgyExtension)
+(instancetype)itemWithImage:(NSString *)image HeightImage:(NSString *)heightImage Target:(id)target action:(SEL)action;
@end
