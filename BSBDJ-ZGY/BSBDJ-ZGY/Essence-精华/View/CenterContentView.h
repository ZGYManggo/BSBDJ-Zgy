//
//  CenterContentView.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/28.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

@interface CenterContentView : UIView
@property (nonatomic,strong) TopicModel *model;
@property (nonatomic,assign) CGSize contentF;
+ (CGFloat)heighOfContentView:(TopicModel *)model;
@end
