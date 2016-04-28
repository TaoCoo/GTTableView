//
//  GTTableViewSectionItem.h
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

/**
 *  该类是描述每一个section,可以在子类定义一些property用于展示区头视图
 */

#import <Foundation/Foundation.h>

@interface GTTableViewSectionItem : NSObject

/**
 *  初始化每个section的数据，
 *
 *  @param items 每个section对应的cell数组
 *
 *  @return 自身对象
 */

- (instancetype)initWithSectionItems:(NSMutableArray *)items;

/**
 *  持有自身初始化后的item
 */
@property (nonatomic,strong) NSMutableArray *items;

@end
