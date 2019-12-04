//
//  EstimatedTableCell.h
//  EstimatedItemSize
//
//  Created by 杨俊杰 on 2019/12/3.
//  Copyright © 2019 littledogboy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EstimatedTableCell : UITableViewCell

- (void)setData:(NSIndexPath *)index;

- (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END
