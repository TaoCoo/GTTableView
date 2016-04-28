//
//  ViewController.m
//  GTTableView
//
//  Created by gt on 16/4/28.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "ViewController.h"
#import "GTUITableView.h"
#import "MainDataSource.h"
#import "MainSectionItem.h"
#import "MainRowItem.h"

@interface ViewController ()<GTTableViewDelegate>

@property (nonatomic,strong) GTUITableView *tableView;
@property (nonatomic,strong) MainDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[GTUITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _dataSource = [[MainDataSource alloc] init];
    _tableView.dataSource = _dataSource;
    _tableView.gtDelegate = self;

}

#pragma mark - GTTableViewDelegate

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath{
    MainRowItem *item = (MainRowItem *)object;
    NSLog(@"----%@-----",item.labelText);
};

- (UIView *)headerViewForSectionItem:(MainSectionItem *)sectionItem atSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    label.text = sectionItem.sectionHeaderTitle;
    label.backgroundColor = [UIColor redColor];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)headerViewHeightForSectionItem:(MainSectionItem *)sectionItem atSection:(NSInteger)section{
    return 30;
}

- (CGFloat)footerViewHeightForSectionItem:(MainSectionItem *)sectionItem atSection:(NSInteger)section{
    return 0.01;
}


@end
