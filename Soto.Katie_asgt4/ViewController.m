//
//  ViewController.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 19/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize metroController = _metroController;

//if "metroController" is a null pointer, we need to initalize it
-(MetrolinkTableController*) metroController;
{
    if(_metroController == nil)
    {
        _metroController = [[MetrolinkTableController alloc] initWithStyle:UITableViewStylePlain];
    }
    return _metroController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
