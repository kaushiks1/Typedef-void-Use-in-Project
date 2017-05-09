//
//  ViewController.h
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewManager.h"
#import "ImageCache.h"
#import "NetworkManager.h"
#import "ResponseDataModel.h"
#import "PhotoDataModel.h"



@interface ViewController : UIViewController


@property (strong, nonatomic) NSMutableArray *arrMain;
@property (nonatomic, retain) CollectionViewManager *aCollectionViewManager;
@property (strong, nonatomic) NSCache *imageCache;
@property (strong, nonatomic) ResponseDataModel *aResponseDataModelFlickerAPI;

@property (weak, nonatomic) IBOutlet UICollectionView *clctnVw;
@property (weak, nonatomic) IBOutlet UIButton *btnLoadImages;



- (IBAction)btnLoadImage:(id)sender;

@end

