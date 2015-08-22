//
//  ItemCell.m
//  TablePosition
//
//  Created by KentarOu on 2015/08/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (IBAction)changeStatus:(id)sender {
    
    if (_item.buttonStatus) {
        
        _item.buttonStatus = NO;
        _checkButton.backgroundColor = [UIColor redColor];
    } else {
        
        _item.buttonStatus = YES;
        _checkButton.backgroundColor = [UIColor blueColor];
    }
}


- (void) setItem:(Item *)item {
    
    _item = item;
    if (_item.buttonStatus) {
        
        _checkButton.backgroundColor = [UIColor blueColor];
    } else {
        _checkButton.backgroundColor = [UIColor redColor];
    }
}

@end
