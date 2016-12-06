//
//  CenterContentView.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/28.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "CenterContentView.h"
#import "BigImageViewController.h"

@interface CenterContentView()
@property (nonatomic,assign) BOOL isBigPicture;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *gifIcon;
@property (nonatomic,strong) UIButton *seeBigPic;
@end

@implementation CenterContentView

-(UIButton *)seeBigPic{
    if (!_seeBigPic) {
        _seeBigPic = [[UIButton alloc]init];
        [_seeBigPic addTarget:self action:@selector(handleTapImageView:) forControlEvents:UIControlEventTouchUpInside];
        [_seeBigPic setTitle:@"点击查看大图" forState:UIControlStateNormal];
        [_seeBigPic setImage:[UIImage imageNamed:@"see-big-picture"] forState:UIControlStateNormal];
        [_seeBigPic setBackgroundImage:[UIImage imageNamed:@"see-big-picture-background"] forState:UIControlStateNormal];
        _seeBigPic.hidden = YES;
    }
    return _seeBigPic;
}

-(UIImageView *)gifIcon{
    if (!_gifIcon) {
        _gifIcon = [[UIImageView alloc]init];
        _gifIcon.hidden = YES;
        _gifIcon.image = [UIImage imageNamed:@"common-gif"];
    }
    return _gifIcon;
}
-(UIImageView *)imageView{

    if (!_imageView) {//这部分处理的东西 可以把imageview抽出来。现在暂时先像这样写吧。音频控件同理。
        UIImageView *imageview = [[UIImageView alloc]init];
        _imageView = imageview;
        imageview.contentMode = UIViewContentModeScaleToFill;
//        imageview.layer.masksToBounds = YES;
        imageview.clipsToBounds = YES;
        imageview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapImageView:)];
        [imageview addGestureRecognizer:tapGesture];
        [self addSubview:imageview];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
        [self.imageView addSubview:self.gifIcon];
        [self.gifIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(@31);
            make.left.and.top.equalTo(self.imageView);
        }];
        [self.imageView addSubview:self.seeBigPic];
        [self.seeBigPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.left.and.right.equalTo(self.imageView);
            make.height.equalTo(@44);
        }];
    }
    return _imageView;
}

-(void)setModel:(TopicModel *)model{
    _model = model;

    
    switch (model.type) {
        case PictureTopicType:
        {
            CGFloat height = (SCREEN_WIDTH - Margin * 2) * model.height / model.width;
            if (height >= [UIScreen mainScreen].bounds.size.height) {
                self.imageView.contentMode = UIViewContentModeTop;
                self.seeBigPic.hidden = NO;
            }else{
                self.imageView.contentMode = UIViewContentModeScaleToFill;
                self.seeBigPic.hidden = YES;
            }

            if ([model.large_image.lowercaseString hasSuffix:@"gif"]) {
                self.gifIcon.hidden = NO;
            }else{
                self.gifIcon.hidden = YES;
            }
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

    BigImageViewController *VC = [[BigImageViewController alloc]init];
    VC.model = self.model;
    [[self findParentController] presentViewController:VC animated:YES completion:nil];
}

#pragma mark - public
+ (CGFloat)heighOfContentView:(TopicModel *)model{//这部分可以写进model 也可以写进对应的cell中。我觉得这个无所谓
    //后面发现还是写进model里比较好，多出会用到。
    if (model.type != WordTopicType) {
        // 图片高度需要根据能显示的最大宽度等比进行计算 中间内容高度 = 中间内容宽度 * 图片实际高度 / 图片实际宽度
        if (model.width < (SCREEN_WIDTH - Margin * 2)) {
                return model.height;
        }
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
