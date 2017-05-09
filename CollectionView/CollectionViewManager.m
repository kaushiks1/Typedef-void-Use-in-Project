//
//  CollectionViewModel.m
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "CollectionViewManager.h"

@implementation CollectionViewManager


-(id)initwithCollectionView:(UICollectionView *)aCollectionView dataSourve:(NSMutableArray *)aDataSource withTapOnCollectionViewCellBlock:(DidTapOnCollectionViewCell)aBlock
{
    if (self == [super init])
    {
        
    self.didTapOnCollectionViewCell = aBlock;
    self.collectionView = aCollectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.arrMain = aDataSource;
        
    
    }
    return self;
}


#pragma mark - CollectionView Reload
- (void)reloadCollectionViewData
{
    [self.collectionView reloadData];
}


#pragma mark - CollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrMain count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *staticIdentifier = @"Cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:staticIdentifier forIndexPath:indexPath];
    [cell setupImage:[self.arrMain objectAtIndex:indexPath.row]];
    cell.delegate = self;
    cell.btnClose.tag = indexPath.row;

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",(long)indexPath.row);
    self.didTapOnCollectionViewCell(indexPath.row,[self.arrMain objectAtIndex:indexPath.row]);
    
    
//    // animate the cell user tapped on
//    UICollectionViewCell  *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    
//    aFrame = cell.frame;
//    aIndexPath = indexPath;
//    
//    NSLog(@"%f",WD);
//    NSLog(@"%f",HT);
//    
//    [UIView animateWithDuration:1.0
//                          delay:0
//                        options:(UIViewAnimationOptionAllowUserInteraction)
//                     animations:^{
//                         NSLog(@"animation start");
//                         cell.frame = CGRectMake(WD/3, HT/3, cell.frame.size.width, cell.frame.size.height);
//                         [self.collectionView bringSubviewToFront:cell];
//                     }
//                     completion:^(BOOL finished){
//                         NSLog(@"animation end");
//                        // [cell setBackgroundColor:[UIColor whiteColor]];
//                         
//                     }
//     ];
    
    
}

- (void)closeButtonPressedAtCellIndex:(NSInteger)cellIndex
{
    NSLog(@"closeButtonPressedAtCellIndex");
    NSLog(@"%ld",(long)cellIndex);
    [self.collectionView reloadData];
    
    UICollectionViewCell  *cell = [self.collectionView cellForItemAtIndexPath:aIndexPath];
    
//    aFrame = cell.frame;
//    aIndexPath = indexPath.row;
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         NSLog(@"animation start");
                         cell.frame = aFrame;
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"animation end");
                         // [cell setBackgroundColor:[UIColor whiteColor]];
                         
                     }
     ];
    
}





@end
