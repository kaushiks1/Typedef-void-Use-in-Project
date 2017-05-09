//
//  ResponseDataModel.m
//  CollectionView
//
//  Created by Apple on 19/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ResponseDataModel.h"

@implementation ResponseDataModel

- (NSMutableArray *)asMutableArrayPhotoWithPhotoDataModel
{
    NSMutableArray *arrayPhotoes = [NSMutableArray new];
    
    
    if (self.photo != nil)
    {
        for (NSDictionary *dic in self.photo)
        {
            PhotoDataModel *aPhotoDataModel = [PhotoDataModel new];
            aPhotoDataModel.farm = [dic objectForKey:@"farm"];
            aPhotoDataModel.aid = [dic objectForKey:@"id"];
            aPhotoDataModel.isfamily = [dic objectForKey:@"isfamily"];
            aPhotoDataModel.isfriend = [dic objectForKey:@"isfriend"];
            aPhotoDataModel.ispublic = [dic objectForKey:@"ispublic"];
            aPhotoDataModel.owner = [dic objectForKey:@"owner"];
            aPhotoDataModel.secret = [dic objectForKey:@"secret"];
            aPhotoDataModel.server = [dic objectForKey:@"server"];
            aPhotoDataModel.title = [dic objectForKey:@"title"];
            aPhotoDataModel.imgaeURL = [aPhotoDataModel getImgaeURL];
            
            [arrayPhotoes addObject:aPhotoDataModel];
            
        }
        
        NSLog(@"%@",arrayPhotoes);
    }
    
    return arrayPhotoes;
}





@end
