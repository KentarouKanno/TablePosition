//
//  Item.h
//  TablePosition
//
//  Created by KentarOu on 2015/08/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@interface Item : NSObject

@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic ,readwrite) NSString *index;
@property (nonatomic, assign) BOOL buttonStatus;


@property (nonatomic,assign) NSInteger cellHeight;

- (id) initWithItem:(NSIndexPath*)indexPath cellHeight:(NSInteger)height;

@end
