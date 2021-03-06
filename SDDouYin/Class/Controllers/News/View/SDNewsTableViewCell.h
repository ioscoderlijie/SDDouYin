//
//  SDNewsTableViewCell.h
//  SDDouYin
//
//  Created by slowdony on 2018/5/17.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDBaseTableViewCell.h"

@interface SDNewsTableViewCell : SDBaseTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong)  UIImageView *headImageView;
@property (nonatomic,strong)  UILabel *nameLabel;
@property (nonatomic,strong)  UILabel *detailLabel;
@property (nonatomic,strong)  UILabel *timeLabel;
@end
