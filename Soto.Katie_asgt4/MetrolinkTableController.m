//Metrolink: Trying to use DYNAMIC cells
//

#import "MetrolinkTableController.h"

@interface MetrolinkTableController ()

@end

@implementation MetrolinkTableController

@synthesize displayList;
@synthesize metroData = _metroData;
@synthesize detailView = _detailView;

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
//if a null pointer, we need to initalize it
-(MetrolinkDetailViewController*) detailView;
{
    if(_detailView == nil)
    {
        _detailView = [[MetrolinkDetailViewController alloc] init];
    }
    return _detailView;
}

//***********************************************

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowMetroDetails"])
    {
        //_detailView = [segue destinationViewController];
        MetrolinkDetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        detailViewController.metroData = [[NSArray alloc]
                                 initWithObjects:
                                 [self.metroData.metroCities objectAtIndex:[myIndexPath row]],
                                 [self.metroData.metroImages objectAtIndex:[myIndexPath row]],
                                 [self.metroData.metroTimes objectAtIndex:[myIndexPath row]],
                                 nil];
        
    }
}

//***********************************************

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Time Zones", @"Time Zones title");
    //self.displayList = [[NSTimeZone knowndisplayList] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.displayList = [NSArray arrayWithObjects:@"hey", @"this", @"is", @"a", @"test", nil];
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
    return [displayList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"metrolinkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.accessoryView =
    }
    
	// Set up the cell.
	NSString *currentDisplayedItem = [displayList objectAtIndex:indexPath.row];
	cell.textLabel.text = currentDisplayedItem;
    cell.detailTextLabel.text = @"test";
    
    UIImage *theImage = [UIImage imageNamed:(@"12-6AM.png")];
    cell.imageView.image = theImage;
    
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
