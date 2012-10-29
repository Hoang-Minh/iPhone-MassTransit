//
//  OCTAWebPDFController.h
//  Soto.Katie_asgt4
//
//  Created by CPSC491T on 10/29/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTADataSource.h"

@interface OCTAWebPDFController : UIViewController
{
    IBOutlet UIWebView *webView;
    int selectedIndex;
    OCTADataSource *_octaData;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (assign) int selectedIndex;
@property (nonatomic, retain) OCTADataSource *octaData;




@end
