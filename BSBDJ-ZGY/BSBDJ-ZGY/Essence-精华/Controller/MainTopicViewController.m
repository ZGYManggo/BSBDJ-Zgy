//
//  MainTopicViewController.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/23.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MainTopicViewController.h"
#import "TopicModel.h"
#import "TopicCell.h"
@interface MainTopicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,copy) NSString *maxTime;
@end

@implementation MainTopicViewController
-(void)loadView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(35 + 64, 0, 49, 0);
    tableView.contentInset = UIEdgeInsetsMake(35 + 64, 0, 49, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor grayColorWithRGB:178 a:1];
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
    params[@"type"] = @10;
    
    [ZgHttpTool toolWith:ZgGet param:params url:
     CommonURL success:^(id obj) {
         if ( [obj isKindOfClass:[NSDictionary class]]) {
             self.dataArr = [TopicModel mj_objectArrayWithKeyValuesArray:obj[@"list"]];
             self.maxTime = obj[@"info"][@"maxtime"];
             [self.thisTableView reloadData];
         }
     } failure:^(NSString *errMsg) {
         NSLog(@"%@",errMsg);
     }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TopicCell getHeightOfCell:self.dataArr[indexPath.row]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topicCell"];
    if (!cell) {
        cell = [[TopicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topicCell"];
    }
    cell.topicModel = self.dataArr[indexPath.row];
    return cell;
}

@end
