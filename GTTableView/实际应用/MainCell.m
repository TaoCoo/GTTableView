//
//  MainCell.m
//  TableViewOptimize
//
//  Created by gt on 16/4/20.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "MainCell.h"
#import "MainRowItem.h"

@implementation MainCell{
    UIImageView *_imgView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 10, 30, 30)];
        [self addSubview:_imgView];

    }
    return self;
}

- (void)setRowItem:(MainRowItem *)rowItem{

   // MainRowItem *item = (MainRowItem *)rowItem;
    self.textLabel.text = rowItem.labelText;
    _imgView.image = [UIImage imageNamed:rowItem.imageString];
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(MainRowItem *)rowItem{
//    MainRowItem *item = (MainRowItem *)rowItem;
//    NSLog(@"----%@----",rowItem.labelText);
    return 100;
}

@end
