//
//  EssenceViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "EssenceViewController.h"
#import "UIBarButtonItem+ZgyExtension.h"
#import "TitleView.h"
#import <UIImageView+WebCache.h>
#import "AllTopicController.h"
#import "VideoTopicController.h"
#import "VoiceTopicController.h"
#import "PictureTopicController.h"
#import "WordTopicController.h"

@interface EssenceViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *mainScroll;
@property (nonatomic,strong) TitleView *titleView;
@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" HeightImage:@"MainTagSubIconClick"Target:self action:@selector(tappedBarButton)];
    self.view.backgroundColor = [UIColor grayColorWithRGB:206 a:1];
    self.mainScroll = [[UIScrollView alloc]init];
    self.mainScroll.showsHorizontalScrollIndicator = NO;
    self.mainScroll.pagingEnabled= YES;
    self.mainScroll.delegate = self;
    [self.view addSubview:self.mainScroll];
    [self.mainScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    [self addSubViewController];
    [self setUpTitleView];
  
}

- (void)addSubViewController{
    AllTopicController * allTopic = [[AllTopicController alloc]init];
    VideoTopicController *videoTopic = [[VideoTopicController alloc]init];
    VoiceTopicController *voiceTopic = [[VoiceTopicController alloc]init];
    PictureTopicController *pictureTopic = [[PictureTopicController alloc]init];
    WordTopicController *wordTopic = [[WordTopicController alloc]init];
    [self addChildViewController:allTopic];
    [self addChildViewController:videoTopic];
    [self addChildViewController:voiceTopic];
    [self addChildViewController:pictureTopic];
    [self addChildViewController:wordTopic];

//    allTopic.view.frame = self.mainScroll.bounds;
//    NSLog(@"%@",NSStringFromCGRect(allTopic.view.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.mainScroll.bounds));

    [self.mainScroll addSubview:allTopic.view];
//    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));

    self.mainScroll.contentSize = CGSizeMake(self.childViewControllers.count * SCREEN_WIDTH, 0);
}

- (void)setUpTitleView{
    NSArray *titlesArr = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    self.titleView =[[TitleView alloc]initWithTitleArr:titlesArr];
    [self.view addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        NSLog(@"%@",self.mas_topLayoutGuideTop);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.height.equalTo(@35);
    }];
    WEAKSELF(ws);
    self.titleView.tappedBlock = ^(NSInteger index){
        [ws.mainScroll setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:YES];
    };
}

#pragma mark - action

- (void)tappedBarButton{
   UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - scrollview Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x < 0 || scrollView.contentOffset.x > SCREEN_WIDTH * (self.childViewControllers.count - 1)) {
        return;
    }
    [self.titleView pageChangeWithpoint:scrollView.contentOffset.x];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSUInteger index = scrollView.contentOffset.x / self.mainScroll.frame.size.width;
    UIViewController *VC = self.childViewControllers[index];
    if ([VC.view superview]) {
        return;
    }
    VC.view.frame = scrollView.bounds;
    NSLog(@"%@",NSStringFromCGRect(scrollView.bounds));
    [self.mainScroll addSubview:VC.view];

}
@end
