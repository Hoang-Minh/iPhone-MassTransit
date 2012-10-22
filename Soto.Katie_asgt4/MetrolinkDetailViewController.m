//
//  MetrolinkDetailViewController.m
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "MetrolinkDetailViewController.h"

@interface MetrolinkDetailViewController ()

@end

@implementation MetrolinkDetailViewController

@synthesize metroCity;
@synthesize metroImage;
@synthesize metroTime;

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
    
    //self.metroCity.text =
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
