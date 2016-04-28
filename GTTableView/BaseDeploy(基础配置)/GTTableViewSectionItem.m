//
//  GTTableViewSectionItem.m
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "GTTableViewSectionItem.h"

@implementation GTTableViewSectionItem

- (instancetype)initWithSectionItems:(NSMutableArray *)items{
    if (self = [super init]) {
        _items = [[NSMutableArray alloc] init];
        [_items addObjectsFromArray:items];
    }
    return self;
}

@end
