//
//  GTUITableView.m
//  TableViewOptimize
//
//  Created by gt on 16/4/21.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "GTUITableView.h"
#import "GTTableViewSectionItem.h"
#import "GTBaseTableViewCell.h"

@implementation GTUITableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
    }
    return self;
}

- (void)setGtDataSource:(id<GTTableViewDataSource>)gtDataSource{
    _gtDataSource = gtDataSource;
    self.dataSource = gtDataSource;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
    GTTableViewRowItem *rowItem = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cls = [dataSource tableView:tableView cellClassForObject:rowItem objectForRowAtIndexPath:indexPath];
    
    return [cls tableView:tableView rowHeightForItem:rowItem];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.gtDelegate respondsToSelector:@selector(didSelectObject:atIndexPath:)]) {
        
        id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
        id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
        [self.gtDelegate didSelectObject:object atIndexPath:indexPath];
        
    }else if ([self.gtDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        [self.gtDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.gtDelegate respondsToSelector:@selector(headerViewForSectionItem:atSection:)]) {
        
        id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
        GTTableViewSectionItem *sectionItem = ((GTTableViewDataSource *)dataSource).sections[section];
        return [self.gtDelegate headerViewForSectionItem:sectionItem atSection:section];

    }else if ([self.gtDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]){
        return [self.gtDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([self.gtDelegate respondsToSelector:@selector(headerViewHeightForSectionItem:atSection:)]) {
        id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
        GTTableViewSectionItem *sectionItem = ((GTTableViewDataSource *)dataSource).sections[section];
        return [self.gtDelegate headerViewHeightForSectionItem:sectionItem atSection:section];
    }else if ([self.gtDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]){
        return [self.gtDelegate tableView:tableView heightForHeaderInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if ([self.gtDelegate respondsToSelector:@selector(footerViewForSectionItem:atSection:)]) {
        
        id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
        GTTableViewSectionItem *sectionItem = ((GTTableViewDataSource *)dataSource).sections[section];
        return [self.gtDelegate footerViewForSectionItem:sectionItem atSection:section];
        
    }else if ([self.gtDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]){
        return [self.gtDelegate tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if ([self.gtDelegate respondsToSelector:@selector(footerViewHeightForSectionItem:atSection:)]) {
        id<GTTableViewDataSource> dataSource = (id<GTTableViewDataSource>)self.dataSource;
        GTTableViewSectionItem *sectionItem = ((GTTableViewDataSource *)dataSource).sections[section];
        return [self.gtDelegate footerViewHeightForSectionItem:sectionItem atSection:section];
    }else if ([self.gtDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]){
        return [self.gtDelegate tableView:tableView heightForFooterInSection:section];
    }
    return 0;

}

@end
