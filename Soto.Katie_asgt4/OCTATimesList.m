//
//  OCTATimesList.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTATimesList.h"

@interface OCTATimesList ()

@end

@implementation OCTATimesList

@synthesize stopName;
@synthesize tableView;
@synthesize octaData = _octaData;
@synthesize octaTimes;

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
	
    
    octaTimes = [[NSArray alloc]
                 initWithObjects:@"1:30pm",
                 @"2:30pm",
                 @"3:30pm", nil];

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
    return [octaTimes count];
}
//
//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"octaTimeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
	// Set up the cell.
	cell.textLabel.text = [octaTimes objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"test";
    
    UIImage *theImage = [UIImage imageNamed:(@"12-6AM.png")];
    cell.imageView.image = theImage;
    
    return cell;
}

@end

