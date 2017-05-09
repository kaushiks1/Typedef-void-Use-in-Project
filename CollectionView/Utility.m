//
//  Utility.m
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Utility.h"
#import <objc/message.h>

@implementation Utility


+ (BOOL)isNetworkReachable
{
    BOOL isReachable = NO;
    
    AppDelegate *aAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    Reachability *netReach = [aAppDelegate reachability];
    NetworkStatus netStatus = [netReach currentReachabilityStatus];
    BOOL isConnectionRequired = [netReach connectionRequired];
    
    if ((netStatus == ReachableViaWiFi) || ((netStatus == ReachableViaWWAN) && !isConnectionRequired))
    {
        isReachable = YES;
    }
    return isReachable;
}

+(NSString *)descriptionForObject:(id)objct
{
    unsigned int varCount;
    NSMutableString *descriptionString = [[NSMutableString alloc]init];
    
    objc_property_t *vars = class_copyPropertyList(object_getClass(objct), &varCount);
    
    for (int i = 0; i < varCount; i++)
    {
        objc_property_t var = vars[i];
        
        const char* name = property_getName (var);
        
        NSString *keyValueString = [NSString stringWithFormat:@"\n%@ = %@",[NSString stringWithUTF8String:name],[objct valueForKey:[NSString stringWithUTF8String:name]]];
        [descriptionString appendString:keyValueString];
    }
    
    free(vars);
    return descriptionString;
}


@end
