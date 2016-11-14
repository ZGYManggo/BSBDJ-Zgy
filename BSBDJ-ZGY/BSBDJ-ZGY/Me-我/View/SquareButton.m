//
//  SquareButton.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/14.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "SquareButton.h"
#import <UIButton+WebCache.h>
@interface SquareButton()


@end
@implementation SquareButton

- (instancetype)init{
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor grayColorWithRGB:206 a:1].CGColor;
        self.layer.borderWidth = 0.5f;
    }
    return self;
}

-(void)setModel:(MeSquareModel *)model{
    _model = model;
    [self setTitle:model.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"header_cry_icon"]];

}

-(void)layoutSubviews{
    [super layoutSubviews];
//    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.width.and.height.equalTo(self).multipliedBy(0.5);
//        make.centerX.equalTo(self);
//        make.top.equalTo(self).multipliedBy(0.15);
//    }];
//    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self);
//        make.centerX.equalTo(self.imageView);
//        make.bottom.and.width.equalTo(self);
//        
//    }];
    self.imageView.zg_y = self.zg_height * 0.15;
    self.imageView.zg_width = self.zg_width * 0.5;
    self.imageView.zg_height = self.imageView.zg_width;
    self.imageView.zg_centerX = self.zg_width * 0.5;
    
    self.titleLabel.zg_x = 0;
    self.titleLabel.zg_y = self.imageView.zg_y + self.imageView.zg_height;
    self.titleLabel.zg_width = self.zg_width;
    self.titleLabel.zg_height = self.zg_height - self.imageView.zg_y - self.imageView.zg_height;
}

@end
