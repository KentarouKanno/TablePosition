//
//  Item.m
//  TablePosition
//
//  Created by KentarOu on 2015/08/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id) initWithItem:(NSIndexPath*)indexPath cellHeight:(NSInteger)height {
    
    self = [super init];
    if (self) {
        
        self.indexPath = indexPath;
        self.index = [NSString stringWithFormat:@"Section = %zd,Row = %zd",indexPath.section,indexPath.row];
        self.buttonStatus = YES;
        self.cellHeight = height;
    }
    return self;
}

@end
