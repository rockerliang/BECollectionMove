//
//  BECollectionView.m
//  BECollectionMove
//
//  Created by ihefe26 on 16/2/1.
//  Copyright © 2016年 zhangliang. All rights reserved.
//

#import "BECollectionView.h"

@implementation BECollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.dataArray = [NSMutableArray arrayWithObjects:@"test1",@"test2",@"test3",@"test4",@"test5",@"test6", nil];
        
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowlayout.itemSize = CGSizeMake(100, 30);
        self.collectionViewBE = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowlayout];
        self.collectionViewBE.delegate = self;
        self.collectionViewBE.dataSource = self;
         [self.collectionViewBE registerNib:[UINib nibWithNibName:@"BECollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BECollectionViewCell"];
        [self addSubview:self.collectionViewBE];
        
        self.longPressed = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveCell:)];
        self.longPressed.minimumPressDuration = 1.0f;
        [self.collectionViewBE addGestureRecognizer:self.longPressed];
    }
    return self;
}

#pragma UICollectionViewDelegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BECollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BECollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.contentLabel.text = self.dataArray[indexPath.row];
    cell.contentLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


#pragma

-(void)moveCell:(UILongPressGestureRecognizer *)longPressed
{
    UIGestureRecognizerState state = longPressed.state;
    CGPoint location = [longPressed locationInView:self.collectionViewBE];
    NSIndexPath *indexpath = [self.collectionViewBE indexPathForItemAtPoint:location];
    static UIView       *snapshot = nil;
    static NSIndexPath  *sourceIndexPath = nil;
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            if(indexpath)
            {
                sourceIndexPath = indexpath;
                UICollectionViewCell *cell  = [self.collectionViewBE cellForItemAtIndexPath:indexpath];
                snapshot = [self customSnapshotFromView:cell];
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0f;
                [self.collectionViewBE addSubview:snapshot];
                [UIView animateWithDuration:0.2f animations:^{
                    center.x = location.x;
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    cell.backgroundColor = [UIColor blackColor];
                }];
            }
        
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint center = snapshot.center;
            center.x = location.x;
            center.y = location.y;
            snapshot.center = center;
            if (indexpath && ![indexpath isEqual:sourceIndexPath])
            {
                [self.dataArray exchangeObjectAtIndex:indexpath.row withObjectAtIndex:sourceIndexPath.row];
                [self.collectionViewBE moveItemAtIndexPath:sourceIndexPath toIndexPath:indexpath];
                sourceIndexPath = indexpath;
                
            }
            break;
        }
            
        default:
        {
            UICollectionViewCell *cell = [self.collectionViewBE cellForItemAtIndexPath:sourceIndexPath];
            [UIView animateWithDuration:0.2f animations:^{
                
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                
                // Undo the black-out effect we did.
                cell.backgroundColor = [UIColor whiteColor];
                
            } completion:^(BOOL finished) {
                
                [snapshot removeFromSuperview];
                snapshot = nil;
                
            }];
            sourceIndexPath = nil;
            break;
        }
        
    }
    
}

- (UIView *)customSnapshotFromView:(UIView *)inputView {
    
    UIView *snapshot = [inputView snapshotViewAfterScreenUpdates:YES];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}



@end
