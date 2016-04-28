//
//  MainDataSource.m
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "MainDataSource.h"
#import "MainSectionItem.h"
#import "MainRowItem.h"
#import "MainCell.h"
#import "OtherCell.h"

@implementation MainDataSource

- (instancetype)init{
    if (self = [super init]) {
        
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        MainRowItem *row1 = [[MainRowItem alloc] init];
        row1.labelText = @"1111";
        row1.imageString = @"3.jpg";
        
        MainRowItem *row2 = [[MainRowItem alloc] init];
        row2.labelText = @"222";
        row2.imageString = @"3.jpg";

        MainRowItem *row3 = [[MainRowItem alloc] init];
        row3.labelText = @"3333";
        row3.imageString = @"3.jpg";

        MainRowItem *row4 = [[MainRowItem alloc] init];
        row4.labelText = @"44444";
        row4.imageString = @"3.jpg";

        [arr addObject:row1];
        [arr addObject:row2];
        [arr addObject:row3];
        [arr addObject:row4];
        
        NSMutableArray *arr2 = [[NSMutableArray alloc] init];
        MainRowItem *row5 = [[MainRowItem alloc] init];
        row5.labelText = @"5555";
        row5.imageString = @"1.jpg";
        MainRowItem *row6 = [[MainRowItem alloc] init];
        row6.labelText = @"6666";
        row6.imageString = @"2.jpg";
        
        [arr2 addObject:row5];
        [arr2 addObject:row6];

        MainSectionItem *firstSectionItem = [[MainSectionItem alloc] initWithSectionItems:arr];
        firstSectionItem.sectionHeaderTitle = @"jjjjj";
        
        MainSectionItem *secondSectionItem = [[MainSectionItem alloc] initWithSectionItems:arr2];
        secondSectionItem.sectionHeaderTitle = @"gggggg";

        self.sections = [NSMutableArray arrayWithObjects:firstSectionItem,secondSectionItem, nil];
        
    }
    return self;
}


- (Class)tableView:(UITableView *)tableView cellClassForObject:(GTTableViewRowItem *)object objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [MainCell class];
    }else if (indexPath.section == 1){
        return [OtherCell class];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.sections.count > section) {
        MainSectionItem *sectionItem = self.sections[section];
        return sectionItem.sectionHeaderTitle;
    }
    return nil;

}

@end
