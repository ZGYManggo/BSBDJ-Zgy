//
//  PublishViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/9.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "PublishViewController.h"
#import "UIColor+ZgyExtension.h"
#import "ZgItemButton.h"
#import <Masonry.h>
@interface PublishViewController ()

@end

@implementation PublishViewController

-(instancetype)init{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    //原版本这里是用的一张image，但是我个人觉得这种blur的效果还是要能看见背景比较好，所以这里用的是effectView
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:blur];
    blurView.backgroundColor = [UIColor colorWithr:236 g:236 b:236 a:0.8];
    blurView.frame = self.view.frame;
    [self.view addSubview:blurView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithr:170 g:170 b:170 a:1] forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor colorWithr:239 g:239 b:244 a:1];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [cancelBtn addTarget:self action:@selector(tappedCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [blurView.contentView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.and.bottom.equalTo(blurView);
        make.height.mas_equalTo(40);
    }];
    
    UIImageView *sloganImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    [sloganImg sizeToFit];
    [blurView.contentView addSubview:sloganImg];
    [sloganImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(blurView);
        make.centerY.equalTo(blurView).multipliedBy(0.3);
    }];
    
    [self addButton];
    
}

- (void)addButton{
    
}

- (void)tappedCancelBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
