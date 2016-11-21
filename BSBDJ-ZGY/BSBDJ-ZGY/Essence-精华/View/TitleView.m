//
//  TitleView.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/21.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "TitleView.h"
#import "TitleButton.h"
@interface TitleView()
@property (nonatomic,strong) NSMutableArray<TitleButton *> *buttonArr;
@property (nonatomic,strong) UIView *line;
@property (nonatomic,assign) CGFloat paddingWidth;
@property (nonatomic,assign) CGFloat tempX;
@end
@implementation TitleView

- (instancetype)initWithTitleArr:(NSArray *)titleArr{
    if (self = [super init]) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        self.effect = blur;
        self.backgroundColor = [UIColor grayColorWithRGB:236 a:0.8];
        
        [self drawTitle:titleArr];
        [self drawBottomLine];

        //这里为了计算两个button间距，所以不在titleButton的init执行[progressWithPercentValue]，这样会导致算出来的间距是缩小后的间距从而导致有偏差
        CGRect firstBtnRect = [self.buttonArr.firstObject convertRect:self.buttonArr.firstObject.titleLabel.frame toView:self];
        CGRect secondBtnRect = [self.buttonArr[1] convertRect:self.buttonArr[1].titleLabel.frame toView:self];
        self.paddingWidth = secondBtnRect.origin.x  - firstBtnRect.origin.x;
        self.tempX = [self.buttonArr.firstObject convertPoint:self.buttonArr.firstObject.titleLabel.frame.origin toView:self].x;
        
        [self.buttonArr enumerateObjectsUsingBlock:^(TitleButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj progressWithPercentValue:0];
        }];


    }
    return self;
}
#pragma mark - draw

- (void)drawBottomLine{
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = [UIColor redColor];
    [self insertSubview:self.line atIndex:self.subviews.count];
    [self layoutIfNeeded];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.buttonArr.firstObject.titleLabel.zg_size.width);
        make.height.mas_equalTo(2);
        make.bottom.equalTo(self);
        make.centerX.equalTo(self.buttonArr.firstObject.titleLabel);
    }];
}

- (void)drawTitle:(NSArray *)titleArr{
    self.buttonArr = [NSMutableArray array];
    for (int i = 0 ;i < titleArr.count ; i ++) {
        NSString *title = titleArr[i];
        TitleButton *titleBtn = [[TitleButton alloc]init];
        titleBtn.tag = i;
        titleBtn.titleLabel.text = title;
        [titleBtn addTarget:self action:@selector(tappedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonArr addObject:titleBtn];
        [self addSubview:titleBtn];
    }
    for (int j = 0; j < self.buttonArr.count; j++) {
        TitleButton *btn = self.buttonArr[j];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
        }];
        if (j == 0) {
            btn.selected = YES;
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
            }];
        }else if(j == self.buttonArr.count - 1){
            TitleButton *view = self.buttonArr[j -1];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.left.equalTo(view.mas_right);
                make.width.equalTo(view);
            }];
        }else{
            TitleButton *view = self.buttonArr[j -1];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view.mas_right);
                make.width.equalTo(view);
            }];
        }
    }
}

-(void)setFrame:(CGRect)frame{
    CGRect tempFrame = frame;
    tempFrame.size.width = SCREEN_WIDTH;
    tempFrame.size.height = 35.f;
    frame = tempFrame;
    [super setFrame:frame];
}

#pragma mark - action
- (void)pageChangeWithpoint:(CGFloat)xPoint{
    CGFloat index = xPoint/SCREEN_WIDTH ;
    self.line.zg_x =self.tempX + (index*self.paddingWidth);//bottomLine的移动
    
    NSUInteger leftIndex = (int)index;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = index - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    [self.buttonArr[leftIndex] progressWithPercentValue:scaleLeft];
    if (rightIndex < self.buttonArr.count) {
        [self.buttonArr[rightIndex] progressWithPercentValue:scaleRight];
    }
}

- (void)tappedBtn:(id)sender{
    TitleButton *titleBtn = (TitleButton *)sender;
    if (self.tappedBlock) {
        self.tappedBlock(titleBtn.tag);
    }
}

@end
