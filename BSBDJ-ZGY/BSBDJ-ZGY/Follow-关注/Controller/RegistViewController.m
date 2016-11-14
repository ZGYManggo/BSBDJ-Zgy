//
//  RegistViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginView.h"
#import "RegistView.h"
#import "ZgItemButton.h"
#import "ZgItemModel.h"
@interface RegistViewController ()

@property (nonatomic,assign) BOOL isRegist;
@property (nonatomic,strong) LoginView *loginView;
@property (nonatomic,strong) UIButton *quesionBtn;


@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *bgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_register_background"]];
    bgImage.userInteractionEnabled = YES;
    [self.view addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.bottom.equalTo(self.view);
    }];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(tappedCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:closeBtn];
    
    self.quesionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.quesionBtn setTintColor:[UIColor whiteColor]];
    [self.quesionBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [self.quesionBtn addTarget:self action:@selector(tappedQuesionBtn) forControlEvents:UIControlEventTouchUpInside];
    [bgImage addSubview:self.quesionBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImage).offset(50);
        make.left.equalTo(bgImage).offset(20);
        make.height.and.with.mas_equalTo(@40);
        
    }];
    [self.quesionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(closeBtn);
        make.top.equalTo(closeBtn);
        make.centerY.equalTo(closeBtn);
        make.right.equalTo(bgImage).offset(-20);
    }];
    self.loginView = [[LoginView alloc]init];
    [bgImage addSubview:self.loginView];
    RegistView *registView = [[RegistView alloc]init];
    [bgImage addSubview:registView];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(closeBtn.mas_bottom).offset(60);
        make.left.equalTo(bgImage);
        make.width.equalTo(bgImage);
        make.right.equalTo(registView.mas_left);
    }];
    [registView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(closeBtn.mas_bottom).offset(60);
        make.left.equalTo(self.loginView.mas_right);
        make.width.equalTo(self.loginView);
        
    }];
    
    ZgItemModel *itemModel = [ZgItemModel zgItemWithTitle:@"QQ登陆" imageStr:@"login_QQ_icon" heightImage:@"login_QQ_icon_click"];
    ZgItemModel *itemModel1 = [ZgItemModel zgItemWithTitle:@"微博登陆" imageStr:@"login_sina_icon" heightImage:@"login_sina_icon_click"];
    ZgItemModel *itemModel2 = [ZgItemModel zgItemWithTitle:@"腾讯登陆" imageStr:@"login_tecent_icon" heightImage:@"login_tecent_icon_click"];
    
    NSArray *tempItem = [NSArray arrayWithObjects:itemModel,itemModel1,itemModel2, nil];
    NSMutableArray *buttonArr = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < tempItem.count; i ++) {
        ZgItemModel *model = tempItem[i];
        ZgItemButton *thirdLoginButton = [ZgItemButton buttonWithType:UIButtonTypeCustom];
        [thirdLoginButton setTitle:model.title forState:UIControlStateNormal];
        [thirdLoginButton setImage:model.image forState:UIControlStateNormal];
        [thirdLoginButton setImage:model.heightImage forState:UIControlStateHighlighted];
        [thirdLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bgImage addSubview:thirdLoginButton];
        [buttonArr addObject:thirdLoginButton];
        if (i == 0) {
            [thirdLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(self.view).multipliedBy(0.33);
                make.height.mas_equalTo(@100);
                make.left.equalTo(bgImage);
                make.bottom.equalTo(bgImage).offset(-20);
            }];
        }else {
            UIView *frameView = buttonArr[i - 1];
            [thirdLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(self.view).multipliedBy(0.33);
                make.height.mas_equalTo(@100);
                make.left.equalTo(frameView.mas_right);
                make.bottom.equalTo(bgImage).offset(-20);
            }];
        }
        
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - action
- (void)tappedCloseBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tappedQuesionBtn{
    if (self.isRegist) {
        [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
        }];
    }else{
        [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(-self.view.zg_width);
        }];
    }
    [self.quesionBtn setTitle:self.isRegist?@"注册账号":@"已有账号?" forState:UIControlStateNormal];

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    self.isRegist = !self.isRegist;
}

@end
