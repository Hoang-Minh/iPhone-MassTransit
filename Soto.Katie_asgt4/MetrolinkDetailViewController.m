//Metrolink: Trying to use DYNAMIC cells
//

#import "MetrolinkDetailViewController.h"

@interface MetrolinkDetailViewController ()

@end

@implementation MetrolinkDetailViewController

@synthesize metroCity;
@synthesize metroImage;
@synthesize metroTime;
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
	// Do any additional setup after loading the view.
    
    self.metroCity.text = @"test";
    self.metroTime.text = @"1:00";
    
    UIImage *myImage = [UIImage imageNamed:@"12-6AM.png"];
    self.metroImage.image = myImage;
    
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
