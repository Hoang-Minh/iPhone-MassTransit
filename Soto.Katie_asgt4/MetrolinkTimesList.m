//
//  MetrolinkTimesList.m
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
//  File Description: This file displays the URL of the time/stops information associated
//      with the line and location the user previously selected in the last 2 views.
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
//  Copyright note: The contents of the "viewDidLoad" function have been retrieved and modeled after:
//      Source: Coder Chris Mills
//      Address: http://coderchrismills.wordpress.com/2011/06/25/making-a-pdf-from-a-uiwebview/
//      Author: Chris Mills
//      Date Retrieved: 10/2012
//      Copyright: Unknown, assumed All Rights Reserved.
//

#import "MetrolinkTimesList.h"


@implementation MetrolinkTimesList

@synthesize lineName;
@synthesize cityName;
@synthesize lineURL;
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
    
    NSLog(@"\nlineName = %@, cityName = %@", lineName, cityName);
    
    if (lineName == @"Antelope Valley")
    {
        if(cityName == @"Lancaster")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/102.html";
        }else if(cityName == @"Palmdale")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/114.html";
        }else if(cityName == @"Vincent Grade / Action")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/134.html";
        }else if(cityName == @"Via Princessa")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/117.html";
        }else if(cityName == @"Santa Clarita")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/126.html";
        }else if(cityName == @"Newhall")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/107.html";
        }else if(cityName == @"Sylmar / San Fernando")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/129.html";
        }else if(cityName == @"Sun Valley")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/128.html";
        }else if(cityName == @"Downtown Burbank")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/86.html";
        }else if(cityName == @"Glendale")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/98.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Antelope%20Valley/service_id/1142/stop_id/131.html";
        }else
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Antelope%20Valley/service_id/1142.html";
        }
            
    }else if (lineName == @"Burbank-Bob Hope Airport")
    {
        if(cityName == @"Burbank-Bob Hope Airport")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Burbank-Bob%20Hope%20Airport/service_id/1145/stop_id/85.html";
        }else if (cityName == @"Downtown Burbank")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Burbank-Bob%20Hope%20Airport/service_id/1145/stop_id/86.html";
        }else if (cityName == @"Glendale")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Burbank-Bob%20Hope%20Airport/service_id/1145/stop_id/98.html";
        }else if (cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Burbank-Bob%20Hope%20Airport/service_id/1145/stop_id/131.html";
        }else
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Burbank-Bob%20Hope%20Airport/service_id/1145.html";
        }
    }else if (lineName == @"Inland Empire - Orange County")
    {
        if(cityName == @"Oceanside")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/111.html";
            
        }else if (cityName == @"San Clemente Pier")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/141.html";
        }else if (cityName == @"San Clemente")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/123.html";
        }else if(cityName == @"San Juan Capistrano")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/124.html";
        }else if(cityName == @"Laguna Niguel / Mission Viejo")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/101.html";
        }else if(cityName == @"Irvine")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/100.html";
        }else if(cityName == @"Tustin")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/130.html";
        }else if(cityName == @"Santa Ana")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/125.html";
        }else if(cityName == @"Orange")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/112.html";
        }else if(cityName == @"Anaheim Canyon")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/82.html";
        }else if(cityName == @"West Corona")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/135.html";
        }else if(cityName == @"North Main Corona")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/108.html";
        }else if(cityName == @"Riverside-La Sierra")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/121.html";
        }else if(cityName == @"Riverside-Downtown")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/120.html";
        }else if(cityName == @"San Bernardino")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Inland%20Emp-Orange%20Co/service_id/1153/stop_id/122.html";
        }else
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Inland%20Emp-Orange%20Co/service_id/1153.html";
        }
    }else if (lineName == @"Orange County")
    {
        if(cityName == @"Oceanside")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/111.html";
        }else if(cityName == @"San Clemente Pier")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/141.html";
        }else if(cityName == @"San Clemente")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/123.html";
        }else if(cityName == @"San Juan Capistrano")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/124.html";
        }else if(cityName == @"Laguna Niguel / Mission Viejo")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/101.html";
        }else if(cityName == @"Irvine")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/100.html";
        }else if(cityName == @"Tustin")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/130.html";
        }else if(cityName == @"Santa Ana")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/125.html";
        }else if(cityName == @"Orange")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/112.html";
        }else if(cityName == @"Anaheim")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/81.html";
        }else if(cityName == @"Fullerton")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/97.html";
        }else if(cityName ==  @"Buena Park")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/84.html";
        }else if(cityName ==  @"Norwalk / Santa Fe Springs")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/110.html";
        }else if(cityName == @"Commerce")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/91.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Orange%20County/service_id/1152/stop_id/131.html";
        }else{
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Orange%20County/service_id/1152.html";
        }
                 
    }else if (lineName == @"Riverside")
    {
        if(cityName == @"Riverside-Downtown")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/120.html";
        }else if(cityName == @"Pedley")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/115.html";
        }else if(cityName == @"East Ontario")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/94.html";
        }else if(cityName == @"Downtown Pomona")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/93.html";
        }else if(cityName == @"Industry")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/99.html";
        }else if(cityName == @"Montebello / Commerce")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/105.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Riverside/service_id/1149/stop_id/131.html";
        }else
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Riverside/service_id/1149.html";
        }
        
    }else if (lineName == @"San Bernardino")
    {
        if(cityName == @"Riverside-Downtown")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/120.html";
        }else if(cityName == @"San Bernardino")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/122.html";
        }else if(cityName == @"Rialto")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/119.html";
        }else if(cityName == @"Fontana")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/96.html";
        }else if(cityName == @"Rancho Cucamonga")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/118.html";
        }else if(cityName == @"Upland")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/132.html";
        }else if(cityName == @"Montclair")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/104.html";
        }else if(cityName == @"Claremont")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/90.html";
        }else if(cityName == @"Pomona (North)")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/116.html";
        }else if(cityName == @"Covina")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/92.html";
        }else if(cityName == @"Baldwin Park")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/83.html";
        }else if(cityName == @"El Monte")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/95.html";
        }else if(cityName == @"Cal State LA")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/87.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/San%20Bernardino/service_id/1146/stop_id/131.html";
        }else
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/San%20Bernardino/service_id/1146.html";
        }
                 
    }else if (lineName == @"Ventura County")
    {
        if(cityName == @"East Ventura")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/103.html";
        }else if(cityName == @"Oxnard")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/113.html";
        }else if(cityName == @"Camarillo")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/88.html";
        }else if(cityName == @"Moorpark")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/106.html";
        }else if(cityName == @"Simi Valley")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/127.html";
        }else if(cityName == @"Chatsworth")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/89.html";
        }else if(cityName == @"Northridge")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/109.html";
        }else if(cityName == @"Van Nuys")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/133.html";
        }else if(cityName == @"Burbank-Bob Hope Airport")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/85.html";
        }else if(cityName == @"Downtown Burbank")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/86.html";
        }else if(cityName == @"Glendale")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/98.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/Ventura%20County/service_id/1141/stop_id/131.html";
        }else{
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Ventura%20County/service_id/1141.html";
        }
    }else if (lineName == @"91 Line")
    {
        if(cityName == @"Riverside-Downtown")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/120.html";
        }else if(cityName == @"Riverside-La Sierra")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/121.html";
        }else if(cityName == @"North Main Corona")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/108.html";
        }else if(cityName == @"West Corona")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/135.html";
        }else if(cityName == @"Fullerton")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/97.html";
        }else if(cityName == @"Buena Park")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/84.html";
        }else if(cityName == @"Norwalk / Santa Fe Springs")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/110.html";
        }else if(cityName == @"L.A. Union Station")
        {
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line_station/name/91%20Line/service_id/1150/stop_id/131.html";
        }else{
            self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/91%20Line/service_id/1150.html";
        }
    }else
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/";
    }
    
    NSURL *url = [NSURL URLWithString:self.lineURL];
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
