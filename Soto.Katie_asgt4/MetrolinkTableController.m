//
//  MetrolinkTableControllerViewController.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 19/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "MetrolinkTableController.h"

@interface MetrolinkTableController ()

@end

@implementation MetrolinkTableController

@synthesize timeZoneNames;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Time Zones", @"Time Zones title");
    self.timeZoneNames = [[NSTimeZone knownTimeZoneNames] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //PROBLEM: ************************************NSARRAY IS NULL*******************************************
    NSLog(@"\ntimeZonesNames IN METROLINKTABLECONTROLLER: %@", self.timeZoneNames);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [timeZoneNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	// Set up the cell.
	NSString *timeZoneName = [timeZoneNames objectAtIndex:indexPath.row];
	cell.textLabel.text = timeZoneName;
    
    //PROBLEM: ************************************NEVER GOES HERE*******************************************
    NSLog(@"\nTEXT: %@", cell.textLabel.text);
    
    return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
 */

/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    return self;
}
 */
@end
