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
@property (nonatomic,strong) UIImageView *sloganImg;
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
    sloganImg.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
    self.sloganImg = sloganImg;
    [self addButton:blurView.contentView];
    
    __block int count = 4;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self animationWithShow:YES count:count];
        count -= 3;
    }];
}

- (void)animationWithShow:(BOOL)isShow count:(int)count{
    CGAffineTransform animationTransform;
    if (isShow) {
        animationTransform = CGAffineTransformIdentity;
    }else{
        animationTransform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
    }
    if (count < -1) {
        [self.timer invalidate];
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1
                            options:UIViewAnimationOptionCurveLinear animations:^{
            self.sloganImg.transform = animationTransform;
        } completion:^(BOOL finished) {
            
        }];
        return ;
    }
    if (!isShow) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:NO completion:nil];

        });
    }
    
    UIButton *centerBtn = self.buttonArr[count];
    UIButton *leftBtn = self.buttonArr[count-1];
    UIButton *rightBtn = self.buttonArr[count+1];
    
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        centerBtn.transform = animationTransform;
    } completion:^(BOOL finished) {
    }];
    [UIView animateWithDuration:0.8 delay:0.1 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        rightBtn.transform = animationTransform;
        
    } completion:nil];
    [UIView animateWithDuration:0.8 delay:0.2 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        leftBtn.transform = animationTransform;
        
    } completion:nil];
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
        itemBtn.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
        [self.buttonArr addObject:itemBtn];
        [itemBtn addAnimation];
    }
}

- (void)tappedItemBtn:(UIButton *)sender{
    ZGLog(@"%ld",(long)sender.tag);
}

- (void)tappedCancelBtn{
    __block int count = 4;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self animationWithShow:NO count:count];
        count -= 3;
    }];
}

@end
