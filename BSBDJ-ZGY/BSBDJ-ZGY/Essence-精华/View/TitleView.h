//
//  TitleView.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/21.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^tappedTitleBlock)(NSInteger index);
@interface TitleView : UIVisualEffectView
@property (nonatomic,copy) tappedTitleBlock tappedBlock;

- (instancetype)initWithTitleArr:(NSArray *)titleArr;
- (void)pageChangeWithpoint:(CGFloat)xPoint;

@end
