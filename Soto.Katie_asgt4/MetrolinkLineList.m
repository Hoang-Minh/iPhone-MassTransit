//
//  MetrolinkLineList.m
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
//  File Description: This file gets the complete list of all of Metrolink's lines and
//      displays them in a table view.
//
//  Flow of the "Metrolink" group of code:
//      A) User selects "Metrolink Schedules" from the first main view.
//          A1) MetrolinkLineList view controller is loaded.
//          A2) MetrolinkLineList creates an object of type MetrolinkDataSource
//          A3) MetrolinkDataSource creates and fills arrays containing all of
//              Metrolink's Line Names, and associated City Stop Names.
//          A4) MetrolinkLineList uses the arrays from MetrolinkDataSource to
//              create a table view of all the line names.
//          A5) When a user clicks a cell in MetrolinkLineList, it segues to
//              MetrolinkCityList. During the segue, MetrolinkLineList sends the
//              line name the user just clicked to MetrolinkCityList in the variable
//              MetrolinkCityList.lineName.
//          A6) MetrolinkCityList then uses the lineName from MetrolinkLineList
//              to display the associated stops with that line in a table view.
//          A7) When a user clicks a cell in MetrolinkCityList, the view segues
//              to MetrolinkTimesList, passing along the lineName and cityName.
//          A8) MetrolinkTimesList uses the information given from MetrolinkCityList
//              to display the associated URL of that line + stop, showing the stops
//              and times.
//      B) User selects "Metrolink Map" from the first main view.
//          B1) MetrolinkPDFController view controller is loaded.
//          B2) MetrolinkPDFController opens the local PDF document
//              "Metrolink_All_Lines_timetable_0.pdf", extracts the first page, and
//              passes the page to PDFScrollView.
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

#import "MetrolinkLineList.h"

@interface MetrolinkLineList ()

@end

@implementation MetrolinkLineList

@synthesize metroLinkLines;
@synthesize tableView;
@synthesize metroData = _metroData;

//***********************************************
//if a null pointer, we need to initalize it
-(MetrolinkDataSource*) metroData;
{
    if(_metroData == nil)
    {
        _metroData = [[MetrolinkDataSource alloc] init];
    }
    return _metroData;
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
    //metroLinkLines = [NSArray arrayWithObjects: @"1", @"2", nil];
    metroLinkLines = self.metroData.metroLines;
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
    return [metroLinkLines count];
}

//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"metroLineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
	// Set up the cell.
	cell.textLabel.text = [metroLinkLines objectAtIndex:indexPath.row];
    
    UIImage *theImage = [UIImage imageNamed:(@"metro.png")];
    cell.imageView.image = theImage;
    
    return cell;
}

//***********************************************
/* RETRIEVED FROM APPCODA.COM */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMetroLineDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MetrolinkCityList *destViewController = segue.destinationViewController;
        destViewController.lineName = [metroLinkLines objectAtIndex:indexPath.row];
    }
}

@end
