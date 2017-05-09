//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCache.h"
#import "Utility.h"
#import "Constant.h"


@protocol CellDelegate <NSObject>

- (void)closeButtonPressedAtCellIndex:(NSInteger)cellIndex;

@end


@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<CellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;

@property (weak, nonatomic) IBOutlet UIImageView *imgVw;


- (void)setupImage:(NSString*)ImageUrl;

- (IBAction)btnClosePressed:(id)sender;

@end
