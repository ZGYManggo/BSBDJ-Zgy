//
//  ZgRefreshHeader.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/12/6.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZgRefreshHeader : UIView
UIKIT_EXTERN const CGFloat SURefreshHeaderHeight;
UIKIT_EXTERN const CGFloat SURefreshPointRadius;

@property (nonatomic, copy) void(^handle)();
- (void)starRefreshing;

- (void)endRefreshing;
@end
