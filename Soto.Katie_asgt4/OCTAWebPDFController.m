//
//  OCTAWebPDFController.m
//  Soto.Katie_asgt4
//
//  Created by CPSC491T on 10/29/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//
//from http://coderchrismills.wordpress.com/2011/06/25/making-a-pdf-from-a-uiwebview/

#import "OCTAWebPDFController.h"
#import "OCTADataSource.h"

@interface OCTAWebPDFController ()

@end

@implementation OCTAWebPDFController

@synthesize webView;
@synthesize selectedIndex;
@synthesize octaData = _octaData;

//***********************************************
//if a null pointer, we need to initalize it
-(OCTADataSource*) octaData;
{
    if(_octaData == nil)
    {
        _octaData = [[OCTADataSource alloc] init];
    }
    return _octaData;
}

//***********************************************
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//***********************************************
- (void)viewDidLoad
{
    [super viewDidLoad]; 
    
    //**************get the PDF url, and load it!*****************
	NSURL *url = [NSURL URLWithString:[self.octaData.octaPDFsFull objectAtIndex:self.selectedIndex]];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
    [webView setScalesPageToFit:YES];
}

//***********************************************
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//***********************************************
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
