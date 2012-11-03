//
//  OCTARouteList.m
//  Soto.Katie_asgt4
//
//  Author: Katie Soto
//  Project: iPhone Mass Transit Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 10/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone application that presents the user with a table
//      view containing information on the routes / lines of the OCTA and Metrolink
//      mass transit systems. The user must also be able to view the OCTA and Metrolink
//      pdf maps, and be able to scroll in and out.
//  File Description: This file gets the names of all the routes from OCTADataSource, and
//      displays it in a tableView.
//
//  Flow of the "OCTA" group of code:
//      A) User selects "Octa Schedules" from the first main view.
//          A1) OCTARouteList view controller is loaded.
//          A2) OCTARouteList creates an object of type OCTADataSource
//          A3) OCTADataSource fills an array of all the route names and
//              associated route PDF names from the resource "routes.txt".
//          A4) OCTARouteList uses the routes array from OCTADataSource to
//              create a table view of all route names.
//          A5) When a user clicks a cell in OCTARouteList, it segues to
//              OCTAStopsList. During the segue, OCTARouteList sends the
//              index the user just clicked to OCTAStopsList in the variable
//              OCTAStopsListselectedIndex.
//          A6) OCTAStopsList then uses the selectedIndex from OCTARouteList
//              to find the associated PDF name from the data array. OCTAStopsList
//              displays the pdf name/url in the view.
//          A7) When a user clicks the "View PDF" button, it segues to
//              OCTAWebPDFController. The segue passes on the selected index
//              to the new controller.
//          A8) OCTAWebPDFController uses the selected index to retrieve the
//              pdf name/url from the data array and stores it in a NSURL.
//          A9) OCTAWebPDFController uses the NSURL to retrieve the PDF from
//              the internet and displays it.
//      B) User selects "Octa Map" from the first main view.
//          B1) OCTAPDFController view controller is loaded.
//          B2) OCTAPDFController opens the local PDF document "sysmapjune12.pdf",
//              extracts the first page, and passes the page to PDFScrollView.
//          B3) PDFScrollView and TiledPDFView then work together to display the
//              local pdf in the view.
//
//  Copyright note: The configuration of this file were retrieved from and modeled after:
//      Source: App Coda
//      Address: http://www.appcoda.com/use-storyboards-to-build-navigation-controller-and-table-view/
//      Author: Simon Ng
//      Date Retrieved: 10/2012
//      Copyright: © Copyright 2012 AppCoda · All Rights Reserved
//
//  Copyright note: The contents of the "prepareForSegue" function have been retrieved from and modeled after:
//      Source: App Coda
//      Address: http://www.appcoda.com/storyboards-ios-tutorial-pass-data-between-view-controller-with-segue/
//      Author: Simon Ng
//      Date Retrieved: 10/2012
//      Copyright: © Copyright 2012 AppCoda · All Rights Reserved
//

#import "OCTARouteList.h"
#import "OCTAStopsList.h"

@interface OCTARouteList ()

@end

@implementation OCTARouteList

@synthesize octaRoutes;
@synthesize tableView;
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
    
        //octaRoutes = self.octaData.octaRoutes;
    
    //list contains the routes listed in routes.txt.
    octaRoutes = self.octaData.octaRoutesFull;
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//***********************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [octaRoutes count];
}

//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"octaRouteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
	// Set up the cell.
	cell.textLabel.text = [octaRoutes objectAtIndex:indexPath.row];
    
    UIImage *theImage = [UIImage imageNamed:(@"octa.png")];
    cell.imageView.image = theImage;
    
    return cell;
}

//***********************************************
/* RETRIEVED FROM APPCODA.COM */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showOctaRouteDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        OCTAStopsList *destViewController = segue.destinationViewController;
        destViewController.selectedIndex = indexPath.row;
    }
}

@end
