//
//  BETableView.m
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import "BETableView.h"

@implementation BETableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
        self.tableViewBE = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.tableViewBE.delegate = self;
        self.tableViewBE.dataSource = self;
        [self addSubview:self.tableViewBE];
    
    }
    return self;
}

#pragma UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BETableViewCell"];
    if(cell == nil)
    {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BETableViewCell" owner:self options:nil].firstObject;
    }
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

@end
