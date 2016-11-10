//
//  mainTabBar.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/9.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MainTabBar.h"
#import "UIView+ZgyExtension.h"
#import "PublishViewController.h"
#import "ZgItemModel.h"
@interface MainTabBar()
@property (nonatomic,strong) UIButton *publishButton;
@end

@implementation MainTabBar
-(UIButton *)publishButton
{
    if (_publishButton == nil) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [publishButton addTarget:self action:@selector(tappdPushButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //这个地方用 masonry会显得太麻烦了。果断放弃.
//    for (int count = 0; count < self.subviews.count; count ++ ) {
//        UIView *sub = self.subviews[count];
//        [sub mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        if (count == 2) {
//            
//        }
//        
//    }
    int buttonIndex = 0;
    CGFloat buttonW = self.zg_width / 5;
    CGFloat buttonH = self.zg_height;
    for (UIView *subView in self.subviews) {
        if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        
        if (buttonIndex == 2) {
            //plusButton在第三个位置
            self.publishButton.frame = CGRectMake(buttonIndex * buttonW, 0, buttonW, buttonH);
            // index + 1 位置往后顺移一位
            buttonIndex ++;
            subView.frame = CGRectMake(buttonIndex * buttonW, 0, buttonW, buttonH);
        }else{
            subView.frame = CGRectMake(buttonIndex * buttonW, 0, buttonW, buttonH);
        }
        buttonIndex ++;
        
    }
}

- (void)tappdPushButton{
    PublishViewController *VC = [[PublishViewController alloc]init];
    ZgItemModel *item = [ZgItemModel zgItemWithTitle:@"发视频" imageStr:@"publish-video"];
    ZgItemModel *item1 = [ZgItemModel zgItemWithTitle:@"发图片" imageStr:@"publish-picture"];
    ZgItemModel *item2 = [ZgItemModel zgItemWithTitle:@"发段子" imageStr:@"publish-text"];
    ZgItemModel *item3 = [ZgItemModel zgItemWithTitle:@"发声音" imageStr:@"publish-audio"];
    ZgItemModel *item4 = [ZgItemModel zgItemWithTitle:@"审帖" imageStr:@"publish-review"];
    ZgItemModel *item5 = [ZgItemModel zgItemWithTitle:@"发链接" imageStr:@"publish-offline"];
    VC.itemArr = @[item,item1,item2,item3,item4,item5];
    [[self findParentController] presentViewController:VC animated:YES completion:nil];
}

@end
