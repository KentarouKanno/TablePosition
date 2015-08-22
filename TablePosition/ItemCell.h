//
//  ItemCell.h
//  TablePosition
//
//  Created by KentarOu on 2015/08/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@property (nonatomic, readwrite) Item *item;

@end
