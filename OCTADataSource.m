//
//  OCTADataSource.m
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTADataSource.h"

@implementation OCTADataSource

@synthesize octaCities;
@synthesize octaImages;
//@synthesize octaLines;
@synthesize octaServices;
@synthesize octaTimes;

- (id) init
{
    self = [super init];
    if(self)
    {
        self.octaCities = [[NSArray alloc]
                         initWithObjects:
                         @"Riverside-Downtown",
                         @"Riverside-La Sierra",
                         @"North Main Corona",
                         @"West Corona",
                         @"Fullerton", nil];
        
        self.octaTimes = [[NSArray alloc]
                           initWithObjects:
                           @"5:29",
                           @"5:39",
                           @"5:47",
                           @"5:53",
                           @"6:18", nil];
        /*
        self.octaLines = [[NSArray alloc]
                           initWithObjects:
                           @"Riverside-Downtown",
                           @"Riverside-La Sierra",
                           @"North Main Corona",
                           @"West Corona",
                           @"Fullerton", nil];
        */
        self.octaServices = [[NSArray alloc]
                           initWithObjects:
                           @"701",
                           @"701",
                           @"701",
                           @"701",
                           @"701", nil];
        self.octaImages = [[NSArray alloc]
                           initWithObjects:
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png", nil];
        
    }
    return self;
}


@end

