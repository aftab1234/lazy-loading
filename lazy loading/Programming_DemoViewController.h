//
//  Programming_DemoViewController.h
//  lazy loading
//
//  Created by Sam on 03/03/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Programming_DemoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
     NSMutableData *_responseData;
    int i;
    NSData *imageData1;
    UIImage *image;
}

@property(copy,nonatomic) NSArray *greekLetters;

//- (void)simpleJsonParsingPostMetod;

@end
