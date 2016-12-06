//
//  BigImageViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/12/5.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "BigImageViewController.h"

@interface BigImageViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *imgScrollView;
@property (nonatomic,strong) UIImageView *image;
@end

@implementation BigImageViewController

-(UIScrollView *)imgScrollView{
    if (!_imgScrollView) {
        UIScrollView *imgScrollView = [[UIScrollView alloc]init];
        [self.view addSubview:imgScrollView];
        [imgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.and.bottom.with.equalTo(self.view);
        }];
        imgScrollView.backgroundColor = [UIColor blackColor];
        imgScrollView.delegate = self;
        _imgScrollView = imgScrollView;
    }
    return _imgScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"show_image_back_icon"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(tappedBackBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:backBtn aboveSubview:self.imgScrollView];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(40);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
    self.image = [[UIImageView alloc]init];
    [self.imgScrollView addSubview:self.image];

    self.imgScrollView.maximumZoomScale = self.model.width / (self.view.zg_width ) > 1 ? self.model.width / (self.view.zg_width) : 1;
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.and.right.equalTo(self.imgScrollView);
        make.width.equalTo(self.imgScrollView);
        if (self.model.height > SCREEN_HEIGHT) {
            make.top.and.bottom.equalTo(self.imgScrollView);
        
        }else{
            make.center.equalTo(self.imgScrollView);
        }
    }];
    if (self.model.height > SCREEN_HEIGHT) {
        self.imgScrollView.contentSize = CGSizeMake(0, self.model.height);
    }
    [self.image sd_setImageWithURL:[NSURL URLWithString:self.model.large_image]  placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    [self.view setNeedsLayout];


}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.image;
}

- (void)tappedBackBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
