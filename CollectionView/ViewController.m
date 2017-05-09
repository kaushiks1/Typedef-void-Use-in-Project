//
//  ViewController.m
//  CollectionView
//
//  Created by Apple on 17/05/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnLoadImages.hidden = YES;
    self.arrMain = [[NSMutableArray alloc]init];
    
    self.imageCache = [[NSCache alloc]init];
    
    //Below Method id POST Method
    [[NetworkManager sharedNetworkManager] getImagesWithPOSTMethodFronFlickerAPIRequestParameters:nil withCompletionBlock:^(NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess) {
        
        if (isSucess)
        {
            self.btnLoadImages.hidden = NO;
            NSLog(@"%@",responseFlickerAPI);
            
            self.aResponseDataModelFlickerAPI = responseInResponseDataModelFlickerAPI;
            NSLog(@"%@",[Utility descriptionForObject:responseInResponseDataModelFlickerAPI]);
            
        }
        else
        {
            NSLog(@"%@",responseFlickerAPI);
            NSLog(@"%@",message);
        }
        
    }];
    
    
    

    //Below Methos is Get Method
    [[NetworkManager sharedNetworkManager] getImagesWithGETMethodFronFlickerAPIRequestParameters:nil withCompletionBlock:^(NSMutableDictionary *responseFlickerAPI, ResponseDataModel *responseInResponseDataModelFlickerAPI, NSString *message, BOOL isSucess) {
        
        if (isSucess)
        {
            self.btnLoadImages.hidden = NO;
            NSLog(@"%@",responseFlickerAPI);
            
            self.aResponseDataModelFlickerAPI = responseInResponseDataModelFlickerAPI;
            NSLog(@"%@",[Utility descriptionForObject:responseInResponseDataModelFlickerAPI]);
            
        }
        else
        {
            NSLog(@"%@",responseFlickerAPI);
            NSLog(@"%@",message);
        }
        
    }];
    
    
    
    NSLog(@"apple");

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)btnLoadImage:(id)sender
{
    
    NSLog(@"%@",[Utility descriptionForObject:self.aResponseDataModelFlickerAPI]);

    for (PhotoDataModel *aPhotoDataModel in self.aResponseDataModelFlickerAPI.photo)
    {
        [self.arrMain addObject:aPhotoDataModel.imgaeURL];
        
    }
    
    NSLog(@"%@",self.arrMain);
    
    self.aCollectionViewManager = [[CollectionViewManager alloc]initwithCollectionView:self.clctnVw dataSourve:self.arrMain withTapOnCollectionViewCellBlock:^(NSInteger IndexpathRow, NSString *imageURL) {
        
        NSLog(@"%ld",(long)IndexpathRow);
        NSLog(@"%@",imageURL);
        
        
//        NSArray* arrayStrToArray = [imageURL componentsSeparatedByString: @"/"];
//        
//        NSString *strFileName;
//        
//        NSLog(@"%@",strFileName);
//        strFileName = [arrayStrToArray lastObject];
//        
//        UIImage *img;
//        NSData *data = [ImageCache objectForKey:strFileName];
//        if (data)
//        {
//            img = [UIImage imageWithData:data];
//        
//        }
//        else
//        {
//            img = [UIImage imageNamed:@"funny-love.jpg"];
//        }
//        
//        UIImageView *imgVw = [[UIImageView alloc]init];
//        imgVw.frame = CGRectMake(100, 100, 100, 100);
//        [self.view addSubview:imgVw];
//        NSLog(@"didSelectItemAtIndexPath");
//        
//
//        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//                NSLog(@"starting animiation!");
//                imgVw.backgroundColor = [UIColor blackColor];
//                imgVw.image = img;
//                [imgVw setFrame:CGRectMake(100, 100, 200, 200)];
//            }completion:^(BOOL finished){
//                
//                [imgVw removeFromSuperview];
//                
//            }];
        
        
        
    }];
}
@end
