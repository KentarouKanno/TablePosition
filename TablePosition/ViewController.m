//
//  ViewController.m
//  TablePosition
//
//  Created by KentarOu on 2015/08/22.
//  Copyright (c) 2015年 KentarOu. All rights reserved.
//

#import "ViewController.h"
#import "ItemCell.h"
#import "Item.h"

#define SECTION_HEIGHT 25

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, readwrite) NSMutableArray *sectionArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionArray = [NSMutableArray array];
    
    [_mainTableView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellReuseIdentifier:@"ItemCell"];
    [self makeItem];
}

// データ作成
- (void) makeItem {
    
    int sectionCount = [self makeRANSUU:9 min:5];
    for (int i = 0; i < sectionCount ; i++) {
        
        NSMutableArray *rowArray = [NSMutableArray array];
        int rowCount = [self makeRANSUU:8 min:2];
        
        for (int j = 0; j < rowCount ; j++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            Item *item = [[Item alloc]initWithItem:indexPath cellHeight:[self makeRANSUU:80 min:30]];
            [rowArray addObject:item];
        }
        [_sectionArray addObject:rowArray];
    }
}

// 乱数生成(Max, Min)
- (int)makeRANSUU:(int)max min:(int)min {
    
    int rNumber = arc4random_uniform(max + 1 - min) + min;
    return rNumber;
}

// Section Count
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArray.count;
}

// Row Count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ((NSArray*)_sectionArray[section]).count;
}


// Section Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel* header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320,25)];
    header.text = [NSString stringWithFormat:@"Section%zd",section];
    header.backgroundColor = [UIColor cyanColor];
    return header;
}

// Section Header Height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SECTION_HEIGHT;
}

// Cell Height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *rowArray = _sectionArray[indexPath.section];
    Item *item = rowArray[indexPath.row];
    
    return item.cellHeight;
}

// Make Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *rowArray = _sectionArray[indexPath.section];
    Item *item = rowArray[indexPath.row];
    
    NSString *cellIdentifier = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[ItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.item = item;
    cell.titleLabel.text = item.index;
    
    return cell;
}


- (NSIndexPath*)topScrollPointFromButtonStatus {
    
    for (int i = 0; i < _sectionArray.count; i++) {
        
        NSMutableArray *rowArray = _sectionArray[i];
        for (int j = 0 ; j < rowArray.count ; j++) {
            
            // スクロールしたいセルのIndexを抽出
            Item *item = rowArray[j];
            if (!item.buttonStatus) {
                return item.indexPath;
            }
        }
    }
    return  nil;
}

- (IBAction)scrollButton:(id)sender {
    
    NSIndexPath* index = [self topScrollPointFromButtonStatus];
    if (index) {
        [_mainTableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
