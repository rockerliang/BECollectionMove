//
//  BETableViewCell.m
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import "BETableViewCell.h"

@implementation BETableViewCell

- (void)awakeFromNib {
    // Initialization code
    BECollectionView *collectionBE = [[BECollectionView alloc] initWithFrame:CGRectMake(0, 10, self.rightView.frame.size.width, self.rightView.frame.size.height - 10)];
    collectionBE.backgroundColor = [UIColor whiteColor];
    [self.rightView addSubview:collectionBE];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
