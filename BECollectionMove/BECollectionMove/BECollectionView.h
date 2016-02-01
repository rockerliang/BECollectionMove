//
//  BECollectionView.h
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BECollectionViewCell.h"

@interface BECollectionView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionViewBE;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressed;

@end
