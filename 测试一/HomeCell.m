//
//  HomeCell.m
//  测试一
//
//  Created by 孟凡君 on 2018/3/26.
//  Copyright © 2018年 孟凡君. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

+ (HomeCell *)cellWithTableView:(UITableView *)tableview indePath:(NSIndexPath *)indexPath{
    
    static NSString * homeCellID = @"HomeCell";
    HomeCell * cell = [tableview dequeueReusableCellWithIdentifier:homeCellID];
    if (!cell) {
        
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeCellID];
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatSubView];
    }
    return self;
}

- (void)creatSubView{
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"zhangsan";
    [self.contentView addSubview:self.nameLabel];

}

-(void) layoutSubviews
{
    [super layoutSubviews];
    self.nameLabel.frame = CGRectMake(0, 10, 100, 30);
    
}


@end
