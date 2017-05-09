//
//  PhotoDataModel.m
//  CollectionView
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "PhotoDataModel.h"

@implementation PhotoDataModel

- (NSString *)getImgaeURL
{
    //SERVER_IMAGE_URL @"https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
    //SERVER_IMAGE_URL_SMALL @"https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_s.jpg"
    
    NSString *stringImageURL;
    stringImageURL = [NSString stringWithFormat:SERVER_IMAGE_URL_SMALL,self.farm,self.server,self.aid,self.secret];
    return stringImageURL;
}

- (NSMutableDictionary *)asMutableDictionaryPhotoDataModel
{
    NSMutableDictionary *aDictionaryPhotoDataModel = [NSMutableDictionary new];
    [aDictionaryPhotoDataModel setObject:(self.farm == nil ? @"":self.farm) forKey:@"farm"];
    [aDictionaryPhotoDataModel setObject:(self.aid == nil ? @"":self.aid) forKey:@"aid"];
    [aDictionaryPhotoDataModel setObject:(self.isfamily == nil ? @"":self.isfamily) forKey:@"isfamily"];
    [aDictionaryPhotoDataModel setObject:(self.isfamily == nil ? @"":self.isfriend) forKey:@"isfriend"];
    [aDictionaryPhotoDataModel setObject:(self.ispublic == nil ? @"":self.ispublic) forKey:@"ispublic"];
    [aDictionaryPhotoDataModel setObject:(self.owner == nil ? @"":self.owner) forKey:@"owner"];
    [aDictionaryPhotoDataModel setObject:(self.secret == nil ? @"":self.secret) forKey:@"secret"];
    [aDictionaryPhotoDataModel setObject:(self.server == nil ? @"":self.server) forKey:@"server"];
    [aDictionaryPhotoDataModel setObject:(self.title == nil ? @"":self.title) forKey:@"title"];
    
    return aDictionaryPhotoDataModel;
}

@end
