//
//  TopicCell.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/24.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
@interface TopicCell : UITableViewCell
@property (nonatomic,strong) TopicModel *topicModel;
+ (CGFloat)getHeightOfCell:(TopicModel *)topicModel;
@end
