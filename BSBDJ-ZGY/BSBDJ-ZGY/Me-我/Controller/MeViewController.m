//
//  MeViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MeViewController.h"
#import "UIBarButtonItem+ZgyExtension.h"
@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我";
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" HeightImage:@"mine-setting-icon-click" Target:self action:@selector(tappedSettingBtn)];
    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" HeightImage:@"mine-moon-icon-click" Target:self action:@selector(tappedMoomBtn)];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    
    
}

#pragma mark - action
- (void)tappedSettingBtn{

}

- (void)tappedMoomBtn{

}

#pragma mark - draw

- (void)drawMainTableView{
    UITableView *mainTbale = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:mainTbale];
}

@end
