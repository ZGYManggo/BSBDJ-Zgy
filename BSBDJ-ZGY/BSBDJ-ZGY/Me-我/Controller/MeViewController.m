//
//  MeViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/10.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MeViewController.h"
#import "UIBarButtonItem+ZgyExtension.h"
#import "MeTableFootView.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我";
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" HeightImage:@"mine-setting-icon-click" Target:self action:@selector(tappedSettingBtn)];
    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" HeightImage:@"mine-moon-icon-click" Target:self action:@selector(tappedMoomBtn)];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    UITableView *thisTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:thisTable];
    thisTable.backgroundColor = [UIColor grayColorWithRGB:206 a:1];
    thisTable.tableFooterView = [[MeTableFootView alloc]init];
    thisTable.delegate = self;
    thisTable.dataSource = self;
    thisTable.sectionHeaderHeight = 0;
    thisTable.sectionFooterHeight = 10;
    //因为tableview的样式采用的是 grouped的样式 header那里会默认有个 距上35的偏移，我们想要的效果是每个section间的间距是10 ，所以上面还设置了section的header和footer的height。
    thisTable.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);

}

#pragma mark - action
- (void)tappedSettingBtn{

}

- (void)tappedMoomBtn{

}

#pragma mark - draw


#pragma mark - UITableView Datasoure

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"meCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.text = @"登陆/注册";
    }else{
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    return cell;
}

@end
