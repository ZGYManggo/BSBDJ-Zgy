//
//  SettingViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/17.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "SettingViewController.h"
#import "ClearCacheCell.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *mainTable;
@end

@implementation SettingViewController

-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        [_mainTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"commonCell"];
        [_mainTable registerClass:[ClearCacheCell class] forCellReuseIdentifier:@"clearCell"];
    }
    return _mainTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mainTable];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.and.right.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        ClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clearCell" forIndexPath:indexPath];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commonCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}
@end
