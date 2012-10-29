//
//  OCTAWebPDFController.m
//  Soto.Katie_asgt4
//
//  Created by CPSC491T on 10/29/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTAWebPDFController.h"

@interface OCTAWebPDFController ()

@end

@implementation OCTAWebPDFController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Metrolink_All_Lines_timetable" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [webView setScalesPageToFit:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
