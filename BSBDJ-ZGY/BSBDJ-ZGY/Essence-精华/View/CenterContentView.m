//
//  CenterContentView.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/28.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "CenterContentView.h"
#import <UIImageView+WebCache.h>

@interface CenterContentView()
@property (nonatomic,assign) BOOL isBigPicture;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation CenterContentView

-(UIImageView *)imageView{

    if (!_imageView) {//这部分处理的东西 可以把imageview抽出来。现在暂时先像这样写吧。音频控件同理。
        UIImageView *imageview = [[UIImageView alloc]init];
        _imageView = imageview;
        imageview.contentMode = UIViewContentModeTop;
        imageview.layer.masksToBounds = YES;
        imageview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapImageView:)];
        [self addSubview:imageview];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    return _imageView;
}

-(void)setModel:(TopicModel *)model{
    _model = model;

    
    switch (model.type) {
        case PictureTopicType:
        {

            [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.small_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)handleTapImageView:(UITapGestureRecognizer *)gesture{

    
    
}

#pragma mark - public
+ (CGFloat)heighOfContentView:(TopicModel *)model{//这部分可以写进model 也可以写进对应的cell中。我觉得这个无所谓
    if (model.type != WordTopicType) {
        // 图片高度需要根据能显示的最大宽度等比进行计算 中间内容高度 = 中间内容宽度 * 图片实际高度 / 图片实际宽度
        CGFloat height = (SCREEN_WIDTH - Margin * 2) * model.height / model.width;
        if (height >= [UIScreen mainScreen].bounds.size.height) {
            height = 250;
        }
        return height;
    }else{
        return 0.f;
    }

}
@end
