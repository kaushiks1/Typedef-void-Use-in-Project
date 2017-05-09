//
//  ImageCache.h
//  moveCHECK
//
//  Created by Ramesh on 23/01/16.
//  Copyright © 2016 Saltmines-Mac2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

+ (void) resetCache;
+ (void) setObject:(NSData*)data forKey:(NSString*)key;
+ (id) objectForKey:(NSString*)key;

@end
