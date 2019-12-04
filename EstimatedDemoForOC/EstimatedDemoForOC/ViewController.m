//
//  EstimatedTableCell.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/3.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import "ViewController.h"

#import "EstimatedTableController.h"
#import "EstimatedCollectionController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) EstimatedTableController *estimatedTableVC;
@property (nonatomic, strong) EstimatedCollectionController *estimatedCollectionVC;

@property (nonatomic, strong) NSArray *controllerArrays;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CEll"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = indexPath.row == 0?@"TableView 自适应":@"CollectionView 自适应";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:self.estimatedTableVC animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:self.estimatedCollectionVC animated:YES];
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllerArrays.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
    }
    return _listTableView;
}

- (EstimatedTableController *)estimatedTableVC{
    if (!_estimatedTableVC) {
        _estimatedTableVC = [[EstimatedTableController alloc] init];
    }
    return _estimatedTableVC;
}

- (EstimatedCollectionController *)estimatedCollectionVC{
    if (!_estimatedCollectionVC) {
        _estimatedCollectionVC = [[EstimatedCollectionController alloc] init];
    }
    return _estimatedCollectionVC;
}

- (NSArray *)controllerArrays{
    return @[self.estimatedTableVC,self.estimatedCollectionVC];
}

@end
