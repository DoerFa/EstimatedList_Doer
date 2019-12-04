//
//  EstimatedTableCell.m
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/3.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import "EstimatedTableCell.h"
#import <Masonry/Masonry.h>

#define sortString @"dwnadkjnwakjdnwakjdnajkwdnkwjndkjandwwjkandjwkand"
#define longString @"iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue iOS  swift Android Java Vue "

@interface EstimatedTableCell()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView_i;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSMutableArray<NSString *> *imageArr;


@end

@implementation EstimatedTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configSubViews];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubViews];
    }
    return self;
}

- (void)setData:(NSIndexPath *)index{
    self.label.text = index.row%2 == 0?longString:sortString;
    int imgIndex = arc4random()%2;
    UIImage *image = [UIImage imageNamed:self.imageArr[imgIndex]];
    self.imageView_i.image = image;
    
    [self.imageView_i mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
}

- (void)configSubViews{
    
    [self addSubview:self.imageView_i];
    [self.imageView_i mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(20);
        make.width.equalTo(@(80));
        make.height.equalTo(@(80));
    }];
    
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView_i.mas_bottom).offset(20);
        make.left.equalTo(self.imageView_i.mas_left);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self).offset(-20);
    }];
    
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor cyanColor];
    }
    return _label;
}

- (UIImageView *)imageView_i{
    if (!_imageView_i) {
        _imageView_i = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView_i;
}

- (NSMutableArray *)imageArr{
    if (!_imageArr) {
        _imageArr = @[@"five_star_comment1",@"cancleAppresial"].mutableCopy;
    }
    return _imageArr;
}

#pragma mark -- 计算当前Cell的ContentView的g宽高。
- (CGFloat)getCellHeight{
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:self.contentView.frame.size];
    self.cellHeight = size.height;
    return self.cellHeight;
}

@end
