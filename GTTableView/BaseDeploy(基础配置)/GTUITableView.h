//
//  GTUITableView.h
//  TableViewOptimize
//
//  Created by gt on 16/4/21.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTTableViewDataSource.h"

@class GTTableViewSectionItem;
@class GTTableViewRowItem;

@protocol GTTableViewDelegate <UITableViewDelegate>

@optional

/**
 *  点击cell回调,调用时将object强转成子类对象
 */
- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

/**
 *  定义区头视图
 *
 */
- (UIView *)headerViewForSectionItem:(GTTableViewSectionItem *)sectionItem atSection:(NSInteger)section;

/**
 *  定义区头视图高度
 *
 */
- (CGFloat)headerViewHeightForSectionItem:(GTTableViewSectionItem *)sectionItem atSection:(NSInteger)section;

/**
 *  定义区尾视图
 *
 */
- (UIView *)footerViewForSectionItem:(GTTableViewSectionItem *)sectionItem atSection:(NSInteger)section;

/**
 *  定义区尾视图高度
 *
 */
- (CGFloat)footerViewHeightForSectionItem:(GTTableViewSectionItem *)sectionItem atSection:(NSInteger)section;
@end

@interface GTUITableView : UITableView <GTTableViewDelegate>

@property (nonatomic,assign) id<GTTableViewDataSource> gtDataSource;
@property (nonatomic,assign) id<GTTableViewDelegate> gtDelegate;

@end
