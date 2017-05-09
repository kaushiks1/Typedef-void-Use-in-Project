//
//  Utility.h
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Reachability.h"

@interface Utility : NSObject

+ (BOOL)isNetworkReachable;
+(NSString *)descriptionForObject:(id)objct;

@end
