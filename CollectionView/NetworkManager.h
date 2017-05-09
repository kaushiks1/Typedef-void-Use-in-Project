//
//  NetworkManager.h
//  CollectionView
//
//  Created by Apple on 18/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AFNetworking.h"
#import "Constant.h"
#import "Reachability.h"
#import "ResponseDataModel.h"
#import "Utility.h"

@interface NetworkManager : AFHTTPSessionManager


+ (NetworkManager *)sharedNetworkManager;


- (BOOL)isInternetConnected;

// Below Method is POST Method
- (void)getImagesWithPOSTMethodFronFlickerAPIRequestParameters:(NSMutableDictionary *)aFlickerRequest withCompletionBlock:(void (^) (NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess))completionBlock;

//Below Method is GET Method
- (void)getImagesWithGETMethodFronFlickerAPIRequestParameters:(NSMutableDictionary *)aFlickerRequest withCompletionBlock:(void (^) (NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess))completionBlock;



@end
