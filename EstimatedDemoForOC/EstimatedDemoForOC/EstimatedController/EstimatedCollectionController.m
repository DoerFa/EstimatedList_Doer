//
//  EstimatedCollectionControllerViewController.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/2.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import "EstimatedCollectionController.h"
#import "EstimatedCollectionCell.h"

#define KTestCellIdentifier @"testCell"
#define URLString @"http://bangumi.bilibili.com/api/bangumi_recommend?access_key=a97c86bad48e821156213b9728ba3cec&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3910&cursor=0&device=phone&mobi_app=iphone&pagesize=10&platform=ios&sign=a23ccdd20f2c2d9ae38bc52c5a5a3a5f&ts=1476273037"

@interface EstimatedCollectionController ()<UICollectionViewDelegate,
                                            UICollectionViewDataSource,
                                            UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation EstimatedCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    self.dataArray = [NSMutableArray array];
    for (NSInteger i = 0; i<20; i++) {
        [self.dataArray addObject:@"collection"];
    }
    [self.collectionView reloadData];
    
}

#pragma mark -- Collection Interface

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EstimatedCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTestCellIdentifier forIndexPath:indexPath];
    cell.isHeightCalculated = false;
    cell.backgroundColor = [UIColor redColor];
    cell.descLabel.text = self.dataArray[indexPath.row];

    return cell;
}

#pragma mark -- Setter && Getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.estimatedItemSize = CGSizeMake(100, 100);
        //上下行的间距
        flowLayout.minimumLineSpacing = 2;
        //同一行两个元素的间距
        flowLayout.minimumInteritemSpacing = 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([EstimatedCollectionCell class]) bundle:[NSBundle mainBundle]];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:KTestCellIdentifier];
    }
    return _collectionView;
}

@end
