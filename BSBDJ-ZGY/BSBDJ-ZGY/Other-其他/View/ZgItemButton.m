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

- (void)addAnimation{
    [self addTarget:self action:@selector(tappedDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(tappedUp) forControlEvents:UIControlEventTouchDown];

}

- (void)tappedDown{
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];

}

- (void)tappedUp{
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(2, 2);
        self.alpha = 0;
    }];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.8;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleW = imageW;
    CGFloat titleH = self.bounds.size.height - imageH;
    CGFloat titleX = imageX;
    CGFloat titleY = imageH;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
//    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.top.equalTo(self);
//        make.width.and.height.equalTo(self).multipliedBy(0.8);
//    }];
//    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.imageView.mas_bottom);
//        make.height.equalTo(self).multipliedBy(0.2);
//        make.centerX.equalTo(self);
//
//    }];

}
@end
