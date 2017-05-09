//
//  ResponseDataModel.h
//  CollectionView
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoDataModel.h"

@interface ResponseDataModel : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pages;
@property (nonatomic, assign) NSInteger perpage;
@property (strong, nonatomic) NSMutableArray *photo;
@property (nonatomic, assign) NSInteger total;

- (NSMutableArray *)asMutableArrayPhotoWithPhotoDataModel;

@end
