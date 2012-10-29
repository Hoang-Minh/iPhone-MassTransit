//
//  OCTAStopsList.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTAStopsList.h"
#import "OCTAWebPDFController.h"

@interface OCTAStopsList ()

@end

@implementation OCTAStopsList

@synthesize tableView;
@synthesize octaData = _octaData;
@synthesize octaStops;
@synthesize selectedIndex;
@synthesize pdfUrlLabel;

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
	// Do any additional setup after loading the view.
    
    NSLog(@"\npdf can be viewed at: %@", [self.octaData.octaPDFsFull objectAtIndex:self.selectedIndex]);
    self.pdfUrlLabel.text = [self.octaData.octaPDFsFull objectAtIndex:self.selectedIndex];
    
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

//***********************************************
/* RETRIEVED FROM APPCODA.COM */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewOCTAWebPDF"])
    {
        OCTAWebPDFController *destViewController = segue.destinationViewController;
        destViewController.selectedIndex = self.selectedIndex;
    }
}


 
@end

