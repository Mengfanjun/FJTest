//
//  HomeCell.h
//  测试一
//
//  Created by 孟凡君 on 2018/3/26.
//  Copyright © 2018年 孟凡君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"

@interface HomeCell : MGSwipeTableCell
+ (HomeCell *)cellWithTableView:(UITableView *)tableview indePath:(NSIndexPath *)indexPath;

@property (nonatomic, strong)UILabel     * nameLabel;
@end
