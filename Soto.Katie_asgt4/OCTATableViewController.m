//OCTA: Trying to use STATIC cells
//

#import "OCTATableViewController.h"

@interface OCTATableViewController ()

@end

@implementation OCTATableViewController

@synthesize dataSource = _dataSource;
@synthesize tableCell = _tableCell;

//***********************************************
//if "OCTADataSource" is a null pointer, we need to initalize it
-(OCTADataSource*) dataSource;
{
    if(_dataSource == nil)
    {
        _dataSource = [[OCTADataSource alloc] init];
    }
    return _dataSource;
}
//***********************************************
//if "OCTATableCell" is a null pointer, we need to initalize it
-(OCTATableCell*) tableCell;
{
    if(_tableCell == nil)
    {
        _tableCell = [[OCTATableCell alloc] init];
        //_tableCell = [[OCTATableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:(@"octaTableCell")];
    }
    return _tableCell;
}
//***********************************************
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
//***********************************************
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//***********************************************
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return [self.dataSource.octaCities count];
}
//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"octaTableCell";
    
    OCTATableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // If no cell is available, create a new one using the given identifier.
	if (cell == nil)
    {
		// Use the default cell style.
		cell = [[OCTATableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.accessoryView =
    }

    
    
    cell.octaCity.text = [self.dataSource.octaCities objectAtIndex:[indexPath row]];
    cell.octaService.text = [self.dataSource.octaServices objectAtIndex:[indexPath row]];
    cell.octaTime.text = [self.dataSource.octaTimes objectAtIndex:[indexPath row]];

    UIImage *cellImage = [UIImage imageNamed: [self.dataSource.octaImages objectAtIndex: [indexPath row]]];
    cell.octaImage.image = cellImage;
    
    /*
    cell.octaCity.text = @"test";
    cell.octaService.text = @"testo";
    cell.octaTime.text = @"tests";
    
    cell.octaImage.image = [UIImage imageNamed:@"12.6AM.png"];
    */
    return cell;
}

//***********************************************
@end
