//
//  EstimatedTableController.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/2.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import "EstimatedTableController.h"
#import "EstimatedTableCell.h"

@interface EstimatedTableController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EstimatedTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark -- TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EstimatedTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EstimatedTableCell class]) forIndexPath:indexPath];
    [cell setData:indexPath];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark -- Setter && Getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100.0f;
        [_tableView registerClass:[EstimatedTableCell class] forCellReuseIdentifier:NSStringFromClass([EstimatedTableCell class])];
    }
    return _tableView;
}

@end
