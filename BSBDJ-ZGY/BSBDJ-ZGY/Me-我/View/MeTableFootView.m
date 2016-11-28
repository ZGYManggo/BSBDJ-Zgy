//
//  MeTableFootView.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/14.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "MeTableFootView.h"
#import "ZgHttpTool.h"
#import "MeSquareModel.h"
#import "SquareButton.h"
#import "MeWebViewController.h"

@implementation MeTableFootView

- (instancetype)init{
    if (self = [super init]) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        WEAKSELF(weakSelf);
        [ZgHttpTool toolWith:ZgGet param:params url:CommonURL success:^(id obj) {
            NSArray *dataArr = [MeSquareModel mj_objectArrayWithKeyValuesArray:obj[@"square_list"]];
            [weakSelf drawButtonWith:dataArr];
        } failure:^(NSString *errMsg) {
            NSLog(@"%@",errMsg);
        }];
    }
    return self;
}

- (void)drawButtonWith:(NSArray *)dataArr{
    __block UIView *lastView = nil;
    int cloumn = 4;
    int curRow = ceil(dataArr.count / 4.f);
    for (int i = 0; i < dataArr.count; i ++) {
        MeSquareModel *model = [dataArr objectAtIndex:i];
        SquareButton *button = [[SquareButton alloc]init];
        button.model = model;
        [self addSubview:button];
        [button addTarget:self action:@selector(tappedSquareBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@100);
            make.width.equalTo(self).multipliedBy(0.25);
            
            if (i % cloumn == 0) {
                make.left.equalTo(self);
            } else {
                make.left.equalTo(lastView.mas_right);
                
            }
           
            if (i / cloumn == 0) {
                make.top.equalTo(self);
            } else {
                make.top.mas_equalTo(( i / cloumn ) * 100);
            }
        }];
        lastView = button;
    }
    UITableView *tableView = (UITableView *)self.superview;
    self.zg_height = curRow * 100;
    tableView.tableFooterView = self;
    
    [tableView reloadData];
}

- (void)tappedSquareBtn:(SquareButton *)sender{
    MeSquareModel *model = sender.model;
    
    if ([model.url hasPrefix:@"http"]) {
        MeWebViewController *VC = [[MeWebViewController alloc]init];
        VC.url = model.url;
        [[self findParentController].navigationController pushViewController:VC animated:YES];
    }else if ([model.url hasPrefix:@"mod"]){
        ZGLog(@"跳转到%@界面",model.url);
    }else{
        ZGLog(@"跳转到其他界面");
    }
    
}

@end
