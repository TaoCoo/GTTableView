//
//  GTBaseTableViewCell.m
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "GTBaseTableViewCell.h"
#import "GTTableViewRowItem.h"

@implementation GTBaseTableViewCell

- (void)setRowItem:(id)rowItem{
    
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(GTTableViewRowItem *)rowItem{
    // 根据对应的Item可以计算高度，这里默认设置为44
    return 44;
}

@end
