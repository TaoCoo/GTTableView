//
//  OtherCell.m
//  TableViewOptimize
//
//  Created by gt on 16/4/28.
//  Copyright © 2016年 personal.com. All rights reserved.
//

#import "OtherCell.h"
#import "MainRowItem.h"

@implementation OtherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setRowItem:(MainRowItem *)rowItem{
    
    self.textLabel.textColor = [UIColor greenColor];
    self.textLabel.text = rowItem.labelText;
    
    self.imageView.image = [UIImage imageNamed:rowItem.imageString];
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(MainRowItem *)rowItem{
    return 60;
}


@end
