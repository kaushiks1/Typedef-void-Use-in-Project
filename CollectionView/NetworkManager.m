//
//  NetworkManager.m
//  CollectionView
//
//  Created by Apple on 18/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (NetworkManager *)sharedNetworkManager
{
    static NetworkManager *sharedNetworkManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        
        sharedNetworkManager = [[self alloc]initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
        [sharedNetworkManager setupServerConnection];
        [sharedNetworkManager.reachabilityManager startMonitoring];
        
    });
    
    return sharedNetworkManager;
}

- (void)setupServerConnection
{
    self.securityPolicy.allowInvalidCertificates = YES;
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self setResponseSerializer:responseSerializer];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    [self setRequestSerializer:requestSerializer];
}

- (BOOL)isInternetConnected
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    //(or)
   // Reachability *reach = [Reachability reachabilityWithHostName:@"http://www.google.com"];
    
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus != NotReachable)
    {
        NSLog(@"Internet Rechable");
        return YES;
    }
    else
    {
        NSLog(@"Network Error No Network Available ");
        return NO;
    }
    
}


//Below Method is POST Method
- (void)getImagesWithPOSTMethodFronFlickerAPIRequestParameters:(NSMutableDictionary *)aFlickerRequest withCompletionBlock:(void (^) (NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess))completionBlock
{
    if ([self isInternetConnected])
    {
        [self POST:@"rest/?method=flickr.photos.search&api_key=9f053a84fb6b5a182d8bb57486941cbe&text=Beautyful+Girl&format=json&nojsoncallback=1&api_sig=ff4d55c09a1358e6f8aa475c98222c4f" parameters:aFlickerRequest progress:^(NSProgress * _Nonnull uploadProgress) {
            
        }
           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             if ([[responseObject objectForKey:@"stat"] isEqualToString:@"ok"])
             {
                 NSLog(@"%@",[responseObject objectForKey:@"photos"]);
                 NSMutableDictionary *aResponseObjectInMutableDictionary = [responseObject objectForKey:@"photos"];
                 
                 ResponseDataModel *aResponseDataModel = [ResponseDataModel new];
                 aResponseDataModel.page = [[[responseObject objectForKey:@"photos"] objectForKey:@"page"] integerValue];
                 aResponseDataModel.pages = [[[responseObject objectForKey:@"photos"] objectForKey:@"pages"] integerValue];
                 aResponseDataModel.perpage = [[[responseObject objectForKey:@"photos"] objectForKey:@"perpage"] integerValue];
                 aResponseDataModel.photo = [[responseObject objectForKey:@"photos"] objectForKey:@"photo"];
                 aResponseDataModel.photo = [aResponseDataModel asMutableArrayPhotoWithPhotoDataModel];
                 aResponseDataModel.total = [[[responseObject objectForKey:@"photos"] objectForKey:@"total"] integerValue];
                 
                 NSLog(@"%@",aResponseDataModel);
                 NSLog(@"%@",[Utility descriptionForObject:aResponseDataModel]);
                 
                 completionBlock (aResponseObjectInMutableDictionary, aResponseDataModel, nil,YES);
             }
             else
             {
                 //                NSString *aErrorMessage = [responseObject objectForKey:@"message"];
                 NSString *aErrorMEssage = responseObject;
                 completionBlock (nil, nil, aErrorMEssage, NO);
             }
         }
           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             NSLog(@"%@",error);
             NSLog(@"%@",error.localizedDescription);
             completionBlock (nil, nil, error.localizedDescription, NO);
         }];
    }
    else
    {
        NSLog(@"%@",NETWORK_NOT_REACHEBLE_MESSAGE);
    }
    
}



//Below Method is Get MEthod
- (void)getImagesWithGETMethodFronFlickerAPIRequestParameters:(NSMutableDictionary *)aFlickerRequest withCompletionBlock:(void (^) (NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess))completionBlock
{
    if ([self isInternetConnected])
    {
        [self GET:@"rest/?method=flickr.photos.search&api_key=9f053a84fb6b5a182d8bb57486941cbe&text=Beautyful+Girl&format=json&nojsoncallback=1&api_sig=ff4d55c09a1358e6f8aa475c98222c4f" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            if ([[responseObject objectForKey:@"stat"] isEqualToString:@"ok"])
            {
                NSLog(@"%@",[responseObject objectForKey:@"photos"]);
                NSMutableDictionary *aResponseObjectInMutableDictionary = [responseObject objectForKey:@"photos"];
                
                ResponseDataModel *aResponseDataModel = [ResponseDataModel new];
                aResponseDataModel.page = [[[responseObject objectForKey:@"photos"] objectForKey:@"page"] integerValue];
                aResponseDataModel.pages = [[[responseObject objectForKey:@"photos"] objectForKey:@"pages"] integerValue];
                aResponseDataModel.perpage = [[[responseObject objectForKey:@"photos"] objectForKey:@"perpage"] integerValue];
                aResponseDataModel.photo = [[responseObject objectForKey:@"photos"] objectForKey:@"photo"];
                aResponseDataModel.photo = [aResponseDataModel asMutableArrayPhotoWithPhotoDataModel];
                aResponseDataModel.total = [[[responseObject objectForKey:@"photos"] objectForKey:@"total"] integerValue];
                
                NSLog(@"%@",aResponseDataModel);
                NSLog(@"%@",[Utility descriptionForObject:aResponseDataModel]);
                
                completionBlock (aResponseObjectInMutableDictionary, aResponseDataModel, nil,YES);
            }
            else
            {
//                NSString *aErrorMessage = [responseObject objectForKey:@"message"];
                NSString *aErrorMEssage = responseObject;
                completionBlock (nil, nil, aErrorMEssage, NO);
            }
        }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
        {
            NSLog(@"%@",error);
            NSLog(@"%@",error.localizedDescription);
            completionBlock (nil, nil, error.localizedDescription, NO);
        }];
    }
    else
    {
        NSLog(@"%@",NETWORK_NOT_REACHEBLE_MESSAGE);
    }
    
}



@end
