//
//  FollowViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "FollowViewController.h"
#import "RegistViewController.h"
#import <Masonry.h>
@interface FollowViewController ()

@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
    self.view.backgroundColor = [UIColor grayColorWithRGB:206 a:1];
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
    [icon sizeToFit];
    [self.view addSubview:icon];
    UILabel *tips = [[UILabel alloc]init];
    tips.text = @"请您注册登录";
    [self.view addSubview:tips];
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
     [registButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    [registButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [registButton setTitle:@"立即登录注册" forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(tappedRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registButton];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(tips.mas_top).offset(-100);
    }];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(@40);
        make.top.equalTo(tips.mas_bottom).offset(50);
    }];
}

- (void)tappedRegistBtn{
    RegistViewController *VC = [[RegistViewController alloc]init];
    [self presentViewController:VC animated:YES completion:nil];
}

@end
