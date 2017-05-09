//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell



- (void)setupImage:(NSString*)ImageUrl
{
  
    NSArray* arrayStrToArray = [ImageUrl componentsSeparatedByString: @"/"];
    
    NSString *strFileName;
    
    NSLog(@"%@",strFileName);
    strFileName = [arrayStrToArray lastObject];
    
    NSData *data = [ImageCache objectForKey:strFileName];
    if (data)
    {
        UIImage *image = [UIImage imageWithData:data];
        self.imgVw.image = image;
        
    }
    else
    {
        if ([Utility isNetworkReachable])
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                
                NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageUrl]];
                [ImageCache setObject:imgData forKey:strFileName];
                UIImage *image =   [UIImage imageWithData:imgData];
                self.imgVw.image = image;
                
            });
        }
        else
        {
            NSLog(@"%@",NETWORK_NOT_REACHEBLE_MESSAGE);
            self.imgVw.image = [UIImage imageNamed:@"funny-love.jpg"];
        }        
    }

}

- (IBAction)btnClosePressed:(id)sender {
    
    NSLog(@"btnClosePressed");
    NSLog(@"%ld",(long)self.btnClose.tag);
    [self.delegate closeButtonPressedAtCellIndex:self.btnClose.tag];
}



@end
