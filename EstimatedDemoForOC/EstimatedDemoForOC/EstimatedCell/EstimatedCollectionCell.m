//
//  EstimatedTableCell.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/3.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import "EstimatedCollectionCell.h"
#import "Masonry.h"

@interface EstimatedCollectionCell ()

@property (nonatomic, assign) NSInteger nibNumber;
@property (nonatomic, assign) NSInteger fitNumber;

@end

@implementation EstimatedCollectionCell


- (void)awakeFromNib {
    [super awakeFromNib];
    [self configSubViews];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    __weak typeof(self) ws = self;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(@(0));
        make.right.mas_equalTo(self.imageView.mas_right);
        make.bottom.mas_equalTo(ws.descLabel.mas_bottom).offset(12.0);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(ws.contentView);
        make.width.equalTo(@(kWidth/2-1));
        make.height.mas_equalTo(@(150));
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.imageView.mas_bottom).offset(10.0);
        make.left.width.mas_equalTo(ws.imageView);
        make.height.mas_greaterThanOrEqualTo(@(91)).priority(1000);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(12.0);
    }];
}

//从属性中y优先选取最适合的属性 拦截到之后返回
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.width = size.width;
    newFrame.size.height = size.height;
    layoutAttributes.frame = newFrame;
    
    return layoutAttributes;
}




@end
