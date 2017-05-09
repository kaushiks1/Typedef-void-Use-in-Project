//
//  PhotoDataModel.h
//  CollectionView
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

@interface PhotoDataModel : NSObject

@property (strong, nonatomic) NSString *farm;
@property (strong, nonatomic) NSString *aid;
@property (strong, nonatomic) NSString *isfamily;
@property (strong, nonatomic) NSString *isfriend;
@property (strong, nonatomic) NSString *ispublic;
@property (strong, nonatomic) NSString *owner;
@property (strong, nonatomic) NSString *secret;
@property (strong, nonatomic) NSString *server;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imgaeURL;


- (NSString *)getImgaeURL;
- (NSMutableDictionary *)asMutableDictionaryPhotoDataModel;

@end
