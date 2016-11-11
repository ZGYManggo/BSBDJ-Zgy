//
//  mainTabBarController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/9.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "mainTabBarController.h"
#import "MainNavController.h"
#import "mainTabBar.h"
#import "MeViewController.h"
#import "NewPostsViewController.h"
#import "FollowViewController.h"
#import "EssenceViewController.h"
#import "CommentViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    // Do any additional setup after loading the view.
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    UIViewController *vc1 = [EssenceViewController new];
    UIViewController *vc2 = [NewPostsViewController new];
    UIViewController *vc3 = [FollowViewController new];
    UIViewController *vc4 = [MeViewController new];

    
    [self setValue:[[MainTabBar alloc]init] forKeyPath:@"tabBar"];

    [self addChildControllerWithBgImage:@"tabBar_essence_icon" selectedImg:@"tabBar_essence_click_icon" title:@"精华" viewVC:[[MainNavController alloc] initWithRootViewController:vc1]];
    [self addChildControllerWithBgImage:@"tabBar_new_icon" selectedImg:@"tabBar_new_click_icon" title:@"新帖" viewVC:[[MainNavController alloc] initWithRootViewController:vc2]];
    [self addChildControllerWithBgImage:@"tabBar_friendTrends_icon" selectedImg:@"tabBar_friendTrends_click_icon" title:@"关注" viewVC:[[MainNavController alloc] initWithRootViewController:vc3]];
    [self addChildControllerWithBgImage:@"tabBar_me_icon" selectedImg:@"tabBar_me_click_icon" title:@"我" viewVC:[[MainNavController alloc] initWithRootViewController:vc4]];

}

- (void)addChildControllerWithBgImage:(NSString *)bgImage selectedImg:(NSString *)selectedImage title:(NSString *)title viewVC:(UIViewController *)VC{
    UIImage *bgImg = [UIImage imageNamed:bgImage];
    UIImage *selectedImg = [UIImage imageNamed:selectedImage];
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = bgImg;
    VC.tabBarItem.selectedImage = selectedImg;
    [self addChildViewController:VC];
}

@end
