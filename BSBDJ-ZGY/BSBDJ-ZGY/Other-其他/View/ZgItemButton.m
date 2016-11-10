//
//  ZgItemButton.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "ZgItemButton.h"

@implementation ZgItemButton

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
