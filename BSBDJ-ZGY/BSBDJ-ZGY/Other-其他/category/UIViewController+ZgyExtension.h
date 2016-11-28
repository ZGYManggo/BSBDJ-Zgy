//
//  UIViewController+ZgyExtension.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/25.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZgyExtension)
//若果是main storyborad 传nil就行
+ (instancetype)StoryboradInstanceWithMain:(NSString *)storyboradName;
+(BOOL)isEmpty:(NSString *)str;
@end
