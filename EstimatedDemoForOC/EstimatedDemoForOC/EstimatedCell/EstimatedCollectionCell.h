//
//  EstimatedTableCell.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/3.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EstimatedCollectionCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isHeightCalculated;


@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
