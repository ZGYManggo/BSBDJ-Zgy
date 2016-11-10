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
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor grayColor];

    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor greenColor];

    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor redColor];

    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor blueColor];

    
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
