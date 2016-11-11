//
//  RegistView.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "RegistView.h"
#import "RegistLoginTextField.h"
@implementation RegistView

- (instancetype)init{
    if (self = [super init]) {
        [self draw];
    }
    return self;
}

- (void)draw{
    UIImageView *registBgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_rgister_textfield_bg"]];
    registBgImage.userInteractionEnabled = YES;
    [registBgImage sizeToFit];
    [self addSubview:registBgImage];
    
    RegistLoginTextField *phoneField = [[RegistLoginTextField alloc]init];
    RegistLoginTextField *passwordField = [[RegistLoginTextField alloc]init];
    phoneField.placeholder = @"请输入手机号码";
    passwordField.placeholder = @"请输入密码";
    passwordField.secureTextEntry = YES;
    
    [registBgImage addSubview:phoneField];
    [registBgImage addSubview:passwordField];
    
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setBackgroundImage:[UIImage imageNamed:@"login_register_button"] forState:UIControlStateNormal];
    [registButton setBackgroundImage:[UIImage imageNamed:@"login_register_button_click"] forState:UIControlStateHighlighted];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.layer.cornerRadius = 5.f;
    registButton.layer.masksToBounds = YES;
    [self addSubview:registButton];
    
    [registBgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
    }];
    [phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(registBgImage.mas_height).multipliedBy(0.4);
        make.left.equalTo(registBgImage).offset(10);
        make.right.equalTo(registBgImage).offset(-10);
        make.top.equalTo(registBgImage).offset(5);
    }];
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(registBgImage.mas_height).multipliedBy(0.4);
        make.left.equalTo(registBgImage).offset(10);
        make.right.equalTo(registBgImage).offset(-10);
        make.top.equalTo(phoneField.mas_bottom).offset(10);
    }];
    [registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(registBgImage);
        make.height.mas_equalTo(@40);
        make.centerX.equalTo(registBgImage);
        make.top.equalTo(registBgImage.mas_bottom).offset(30);
        make.bottom.equalTo(self);
        
    }];
}

@end
