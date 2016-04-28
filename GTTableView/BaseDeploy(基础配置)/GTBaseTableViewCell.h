//
//  GTBaseTableViewCell.h
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTTableViewRowItem;

@interface GTBaseTableViewCell : UITableViewCell

/**
 *  自身持有展示cell所要的数据
 *
 *  @param rowItem 继承GTTableViewRowItem的类
 */
- (void)setRowItem:(id)rowItem;

/**
 *  根据GTTableViewRowItem设置cell的高度
 *
 *  @param tableView tableView
 *  @param rowItem   GTTableViewRowItem
 *
 *  @return 高度
 */

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(GTTableViewRowItem *)rowItem;

@end
