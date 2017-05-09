//
//  CollectionViewModel.h
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionViewFlowLayout.h"
#import "CollectionViewCell.h"
#import "Constant.h"


typedef void (^DidTapOnCollectionViewCell)(NSInteger IndexpathRow, NSString *imageURL);
//typedef void (^DidTapOnCloseButton) (NSString *str);

@interface CollectionViewManager : NSObject<UICollectionViewDataSource,UICollectionViewDelegate,CellDelegate>
{
    CGRect aFrame;
    NSIndexPath *aIndexPath;
}

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *arrMain;
@property (nonatomic, copy) DidTapOnCollectionViewCell didTapOnCollectionViewCell;
//@property (nonatomic, copy) DidTapOnCloseButton didTapOnCloseButton;



-(id)initwithCollectionView:(UICollectionView *)aCollectionView dataSourve:(NSMutableArray *)aDataSource withTapOnCollectionViewCellBlock:(DidTapOnCollectionViewCell)aBlock;
- (void)reloadCollectionViewData;

@end
