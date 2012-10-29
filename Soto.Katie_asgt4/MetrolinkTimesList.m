//
//  MetrolinkTimesList.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
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
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Burbank-Bob%20Hope%20Airport/service_id/1145.html";
    }else if (lineName == @"Inland Empire - Orange County")
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Inland%20Emp-Orange%20Co/service_id/1153.html";;
    }else if (lineName == @"Riverside")
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Riverside/service_id/1149.html";
    }else if (lineName == @"San Bernardino")
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/San%20Bernardino/service_id/1146.html";
    }else if (lineName == @"Ventura County")
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/Ventura%20County/service_id/1141.html";
    }else if (lineName == @"91 Line")
    {
        self.lineURL = @"http://www.metrolinktrains.com/schedules/line/name/91%20Line/service_id/1150.html";
    }else {
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
