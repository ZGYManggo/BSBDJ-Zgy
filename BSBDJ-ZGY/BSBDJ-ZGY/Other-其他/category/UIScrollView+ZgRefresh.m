//
//  UIScrollView+ZgRefresh.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/12/6.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "UIScrollView+ZgRefresh.h"
#import <objc/runtime.h>
@implementation UIScrollView (ZgRefresh)
- (void)addRefreshHeaderWithHandle:(void (^)())handle {
    ZgRefreshHeader * header = [[ZgRefreshHeader alloc]init];
    header.handle = handle;
    self.header = header;
    [self insertSubview:header atIndex:0];
}
- (void)setHeader:(ZgRefreshHeader *)header {
    objc_setAssociatedObject(self, @selector(header), header, OBJC_ASSOCIATION_ASSIGN);
}
- (ZgRefreshHeader *)header {
    return objc_getAssociatedObject(self, @selector(header));
}
#pragma mark - Swizzle
+ (void)load {
    Method originalMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method swizzleMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"zg_dealloc"));
    method_exchangeImplementations(originalMethod, swizzleMethod);
}

- (void)zg_dealloc {
    self.header = nil;
    [self zg_dealloc];
}
@end
