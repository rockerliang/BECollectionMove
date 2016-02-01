//
//  BETableView.h
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BETableViewCell.h"

@interface BETableView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableViewBE;

@end
