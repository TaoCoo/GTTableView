//
//  GTTableViewDataSource.m
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "GTTableViewDataSource.h"
#import "GTBaseTableViewCell.h"
#import "GTTableViewSectionItem.h"
#import "GTTableViewRowItem.h"

@implementation GTTableViewDataSource


#pragma mark -GTTableViewDataSource
- (GTTableViewRowItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sections.count > indexPath.section) {
        GTTableViewSectionItem *sectionItem = self.sections[indexPath.section];
        if (sectionItem.items.count > indexPath.row) {
            return sectionItem.items[indexPath.row];
        }
    }
    return nil;
}

- (Class)tableView:(UITableView *)tableView cellClassForObject:(GTTableViewRowItem *)object objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 这个方法子类可以重写，默认的是GTBaseTableViewCell
    return [GTBaseTableViewCell class];
}

#pragma mark -UITableViewDataSource Required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.sections.count > section) {
        GTTableViewSectionItem *sectionItem = self.sections[section];

        return sectionItem.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTTableViewRowItem *rowItem = [self tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cellClass = [self tableView:tableView cellClassForObject:rowItem objectForRowAtIndexPath:indexPath];
    NSString *className = [NSString stringWithUTF8String:object_getClassName(cellClass)];

    [tableView registerClass:[cellClass class] forCellReuseIdentifier:className];
    GTBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className forIndexPath:indexPath];

    // 在此设置cell的baseItem
    [cell setRowItem:rowItem];
    
    return cell;
}

#pragma mark -UITableViewDataSource Optional

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections ? self.sections.count : 0;
}

@end
