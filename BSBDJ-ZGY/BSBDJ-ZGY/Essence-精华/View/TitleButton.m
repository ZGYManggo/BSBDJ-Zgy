//
//  TitleButton.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/21.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

-(instancetype)init{
    if (self = [super init]) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
//        [self progressWithPercentValue:0];

    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    if (selected) {
        self.titleLabel.textColor = [UIColor redColor];
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
}
- (void)progressWithPercentValue:(CGFloat)percentValue{
    
    self.titleLabel.textColor = [UIColor colorWithRed:percentValue green:0.0 blue:0.0 alpha:1];
    
    CGFloat minScale = 0.7;
    CGFloat trueScale = minScale + (1-minScale)*percentValue;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}
@end
