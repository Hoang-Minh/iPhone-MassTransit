//
//  MetrolinkDataSource.m
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
//  File Description: This file creates arrays containing all of Metrolink's Lines, and
//      the associated stops for each line. I was unable to retrieve the data from the
//      http://www.metrolinktrains.com/tripplanner/schedule_data.php resource, so I
//      hard coded them instead.
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


#import "MetrolinkDataSource.h"

@implementation MetrolinkDataSource

@synthesize metroLines;
@synthesize metroAntelopeValleyCities;
@synthesize metroBurbankCities;
@synthesize metroInlandCities;
@synthesize metroOrangeCities;
@synthesize metroRiversideCities;
@synthesize metroSanBernardinoCities;
@synthesize metroVenturaCities;
@synthesize metro91Cities;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        //complete
        self.metroLines = [[NSArray alloc]
                           initWithObjects:@"Antelope Valley",
                           @"Burbank-Bob Hope Airport",
                           @"Inland Empire - Orange County",
                           @"Orange County",
                           @"Riverside",
                           @"San Bernardino",
                           @"Ventura County",
                           @"91 Line", nil];
        
        //complete
        self.metroAntelopeValleyCities = [[NSArray alloc]
                                          initWithObjects:@"Lancaster",
                                          @"Palmdale",
                                          @"Vincent Grade / Action",
                                          @"Via Princessa",
                                          @"Santa Clarita",
                                          @"Newhall",
                                          @"Sylmar / San Fernando",
                                          @"Sun Valley",
                                          @"Downtown Burbank",
                                          @"Glendale",
                                          @"L.A. Union Station", nil];
        
        //complete
        self.metroBurbankCities = [[NSArray alloc]
                                          initWithObjects:@"Burbank-Bob Hope Airport",
                                          @"Downtown Burbank",
                                          @"Glendale",
                                          @"L.A. Union Station", nil];
        
        //complete
        self.metroInlandCities = [[NSArray alloc]
                                          initWithObjects:@"Oceanside",
                                          @"San Clemente Pier",
                                          @"San Clemente",
                                          @"San Juan Capistrano",
                                          @"Laguna Niguel / Mission Viejo",
                                          @"Irvine",
                                          @"Tustin",
                                          @"Santa Ana",
                                          @"Orange",
                                          @"Anaheim Canyon",
                                          @"West Corona",
                                          @"North Main Corona",
                                          @"Riverside-La Sierra",
                                          @"Riverside-Downtown",
                                          @"San Bernardino", nil];
        
        //complete
        self.metroOrangeCities = [[NSArray alloc]
                                  initWithObjects:@"Oceanside",
                                  @"San Clemente Pier",
                                  @"San Clemente",
                                  @"San Juan Capistrano",
                                  @"Laguna Niguel / Mission Viejo",
                                  @"Irvine",
                                  @"Tustin",
                                  @"Santa Ana",
                                  @"Orange",
                                  @"Anaheim",
                                  @"Fullerton",
                                  @"Buena Park",
                                  @"Norwalk / Santa Fe Springs",
                                  @"Commerce",
                                  @"L.A. Union Station", nil];
        
        //complete
        self.metroRiversideCities = [[NSArray alloc]
                                  initWithObjects:@"Riverside-Downtown",
                                  @"Pedley",
                                  @"East Ontario",
                                  @"Downtown Pomona",
                                  @"Industry",
                                  @"Montebello / Commerce",
                                  @"L.A. Union Station", nil];
        
        //complete
        self.metroSanBernardinoCities = [[NSArray alloc]
                                     initWithObjects:@"Riverside-Downtown",
                                     @"San Bernardino",
                                     @"Rialto",
                                     @"Fontana",
                                     @"Rancho Cucamonga",
                                     @"Upland",
                                     @"Montclair",
                                     @"Claremont",
                                     @"Pomona (North)",
                                     @"Covina",
                                     @"Baldwin Park",
                                     @"El Monte",
                                     @"Cal State LA",
                                     @"L.A. Union Station", nil];
        
        //complete
        self.metroVenturaCities = [[NSArray alloc]
                                         initWithObjects:@"East Ventura",
                                         @"Oxnard",
                                         @"Camarillo",
                                         @"Moorpark",
                                         @"Simi Valley",
                                         @"Chatsworth",
                                         @"Northridge",
                                         @"Van Nuys",
                                         @"Burbank-Bob Hope Airport",
                                         @"Downtown Burbank",
                                         @"Glendale",
                                         @"L.A. Union Station", nil];
        
        //complete
        self.metro91Cities = [[NSArray alloc]
                                     initWithObjects:@"Riverside-Downtown",
                                     @"Riverside-La Sierra",
                                     @"North Main Corona",
                                     @"West Corona",
                                     @"Fullerton",
                                     @"Buena Park",
                                     @"Norwalk / Santa Fe Springs",
                                     @"L.A. Union Station", nil];
    
    }
    return self;
}


@end
