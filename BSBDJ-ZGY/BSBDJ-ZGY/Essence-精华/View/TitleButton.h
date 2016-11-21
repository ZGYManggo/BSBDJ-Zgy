//
//  TitleButton.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/21.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleButton : UIControl
@property (nonatomic,strong) UILabel *titleLabel;
- (void)progressWithPercentValue:(CGFloat)percentValue;
@end
