//
//  MainTopicViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/23.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MainTopicViewController.h"
#import "TopicModel.h"
@interface MainTopicViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation MainTopicViewController
-(void)loadView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(35 + 64, 0, 49, 0);
    self.view = tableView;
    _thisTableView = tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"newlist";
    params[@"c"] = @"data";
    params[@"maxtime"] = @1479882563;
    params[@"type"] = @29;
    
    [ZgHttpTool toolWith:ZgGet param:params url:
     @"http://api.budejie.com/api/api_open.php" success:^(id obj) {
         if ( [NSJSONSerialization isValidJSONObject:obj]) {
             NSArray *data = [TopicModel mj_objectArrayWithKeyValuesArray:obj[@"list"]];
             NSLog(@"%@",data);
         }
     } failure:^(NSString *errMsg) {
         NSLog(@"%@",errMsg);
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
