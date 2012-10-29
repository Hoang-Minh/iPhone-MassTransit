//
//  MetrolinkCityList.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "MetrolinkCityList.h"

@interface MetrolinkCityList ()

@end

@implementation MetrolinkCityList

@synthesize lineName;
@synthesize tableView;
@synthesize metroData = _metroData;
@synthesize metroLinkCities;

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
    //lineLabel.text = lineName;
    if (lineName == @"Antelope Valley")
    {
        metroLinkCities = self.metroData.metroAntelopeValleyCities;
    }else if (lineName == @"Burbank-Bob Hope Airport")
    {
        metroLinkCities = self.metroData.metroBurbankCities;
    }else if (lineName == @"Inland Empire - Orange County")
    {
        metroLinkCities = self.metroData.metroInlandCities;
    }else if (lineName == @"Riverside")
    {
        metroLinkCities = self.metroData.metroRiversideCities;
    }else if (lineName == @"San Bernardino")
    {
        metroLinkCities = self.metroData.metroSanBernardinoCities;
    }else if (lineName == @"Ventura County")
    {
        metroLinkCities = self.metroData.metroVenturaCities;
    }else if (lineName == @"91 Line")
    {
        metroLinkCities = self.metroData.metro91Cities;
    }
    
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
    return [metroLinkCities count];
}
//
//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"metroCityCell";
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
	cell.textLabel.text = [metroLinkCities objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"test";
    
    UIImage *theImage = [UIImage imageNamed:(@"metro.png")];
    cell.imageView.image = theImage;
    
    return cell;
}

//***********************************************
/* RETRIEVED FROM APPCODA.COM */
/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMetroLineDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MetrolinkCityList *destViewController = segue.destinationViewController;
        destViewController.lineName = [metroLinkLines objectAtIndex:indexPath.row];
    }
}
*/
@end
