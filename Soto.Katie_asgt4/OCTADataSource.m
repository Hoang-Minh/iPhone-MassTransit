//
//  OCTADataSource.m
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
//  File Description: This file retrieves all route names and associated PDF names from
//      the resource located at: Resources/google_transity/routes.txt.
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
//              OCTAStopsList.selectedIndex.
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
//  Copyright note: The OCTA routes text file has been retrieved from:
//      Source: Google Transit Data Feed
//      Address: http://code.google.com/p/googletransitdatafeed/wiki/PublicFeeds
//      Author: Unknown, assumed OCTA
//      Date Retrieved: 10/2012
//      Copyright: Unknown, assumed All Rights Reserved
//

#import "OCTADataSource.h"

@implementation OCTADataSource

@synthesize octaRoutesFull;
@synthesize octaPDFsFull;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        self.octaRoutesFull = [[NSMutableArray alloc] init];
        self.octaPDFsFull = [[NSMutableArray alloc] init];
        
//GET ROUTE NAMES AND PDF URLS FROM THE TEXT FILE:
        //open the "routes" file...
        NSString *string = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"routes" ofType:@"txt"]];
        
        //seperate based on new lines and commas
        NSArray *arrayNewLines = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n,"]];
        NSString *cleanedString = [[NSString alloc] init];
        //Every 9th element is the route name. For example, these are route names: objectAtIndex: 3, 12, 21, 30, 39,...
        //Every 9th element is the route pdf url. For example, these are route pdf urls: objectAtIndex: 15, 24, 33, 42...
        //SO, put together, we need these elements:
        //12
        //15
        //21
        //24
        //...
        //The following loop will extract the needed elements and put them in 2 different corresponding arrays.
        int i = 12;
        while(i<694)
        {
            if([arrayNewLines objectAtIndex:i])
            {
                //ROUTE NAME
                //first strip it of the extra quotations:
                cleanedString = [[arrayNewLines objectAtIndex:i] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"\""]];
                //now put the cleaned string in the routes array
                [self.octaRoutesFull addObject:cleanedString];
            }
            i=i+3;
            if([arrayNewLines objectAtIndex:i])
            {
                //PDF NAMES
                //first strip it of the extra quotations:
                cleanedString = [[arrayNewLines objectAtIndex:i] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"\""]];
                //now put the cleaned string in the routes array
                [self.octaPDFsFull addObject:cleanedString];
            }
            i=i+6;
        }
    }
    return self;
}


@end

