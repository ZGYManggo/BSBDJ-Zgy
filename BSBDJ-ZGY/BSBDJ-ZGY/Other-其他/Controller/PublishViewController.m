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
#import "ZgItemModel.h"
@interface PublishViewController ()
@property (nonatomic,strong) NSMutableArray *buttonArr;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation PublishViewController

-(NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray arrayWithCapacity:6];
    }
    return _buttonArr;
}

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
    blurView.backgroundColor = [UIColor grayColorWithRGB:236 a:0.8];
    [self.view addSubview:blurView];
    [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.bottom.equalTo(self.view);
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColorWithRGB:170 a:1] forState:UIControlStateNormal];
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
    
    [self addButton:blurView.contentView];
    
    __block int count = 0;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        if (count == self.buttonArr.count) {
            [self.timer invalidate];
            return ;
        }
        
        UIButton *btn = self.buttonArr[count];
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            btn.transform = CGAffineTransformIdentity;
        } completion:nil];
        
        count ++;
    }];
}

- (void)addButton:(UIView *)contentView{
    CGFloat buttonW = SCREEN_WIDTH / 3;
    CGFloat buttonH = 100.f;
    int cloumn = 3;
    int curCloumn = 0;
    int curRow = 0;
    for (int count = 0; count < self.itemArr.count; count ++) {
        ZgItemModel *model = self.itemArr[count];
        curCloumn = count % cloumn;
        curRow = count / cloumn;
        ZgItemButton *itemBtn = [ZgItemButton buttonWithType:UIButtonTypeCustom];
        [itemBtn setTitle:model.title forState:UIControlStateNormal];
        [itemBtn setImage:model.image forState:UIControlStateNormal];
        itemBtn.frame = CGRectMake(curCloumn * buttonW, SCREEN_HEIGHT / 2 - 30 + curRow * (buttonH + 15), buttonW, buttonH);
        itemBtn.tag = count;
        [itemBtn addTarget:self action:@selector(tappedItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:itemBtn];
        itemBtn.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
        [self.buttonArr addObject:itemBtn];
        [itemBtn addAnimation];
    }
}

- (void)tappedItemBtn:(UIButton *)sender{
    ZGLog(@"%ld",(long)sender.tag);
}

- (void)tappedCancelBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
