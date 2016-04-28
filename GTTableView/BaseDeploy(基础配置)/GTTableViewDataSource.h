//
//  GTTableViewDataSource.h
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

/**
 *  该类用来封装DataSource
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GTTableViewRowItem;

@protocol GTTableViewDataSource <UITableViewDataSource>

@optional

/**
 *  根据indexPath返回每个cell具体的rowItem信息，实际使用返回的是GTTableViewRowItem的子类
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return GTTableViewRowItem
 */

- (GTTableViewRowItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  相当于cell的注册，让tableView知道具体indexPath对应的cell类,子类重写该方法
 *
 *  @param tableView tableView
 *  @param rowItem   rowItem
 *  @param indexPath indexPath
 *
 *  @return [cell class]
 */
@required

- (Class)tableView:(UITableView *)tableView cellClassForObject:(GTTableViewRowItem *)object objectForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface GTTableViewDataSource : NSObject <GTTableViewDataSource>

/**
 *  里面的元素是SectionItem,用于多个section的描述
 */
@property (nonatomic,strong) NSMutableArray *sections;

@end
