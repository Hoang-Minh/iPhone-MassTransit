//
//  MetrolinkTimesList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetrolinkTimesList : UIViewController
{
    IBOutlet UIWebView *webView;
    NSString *lineName;
    NSString *cityName;
    NSString *lineURL;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *lineName;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *lineURL;

@end
