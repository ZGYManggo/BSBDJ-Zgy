//
//  UIScrollView+ZgRefresh.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/12/6.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZgRefreshHeader.h"
@interface UIScrollView (ZgRefresh)
@property (nonatomic, weak, readonly) ZgRefreshHeader * header;

- (void)addRefreshHeaderWithHandle:(void (^)())handle;
@end
