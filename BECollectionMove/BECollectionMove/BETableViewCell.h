//
//  BETableViewCell.h
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BECollectionView.h"

@interface BETableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *rightView;

@end
