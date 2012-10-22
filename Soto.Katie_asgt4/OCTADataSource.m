//OCTA: Trying to use STATIC cells
//

#import "OCTADataSource.h"

@implementation OCTADataSource

@synthesize octaCities;
@synthesize octaServices;
@synthesize octaTimes;
@synthesize octaImages;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        self.octaCities = [[NSArray alloc]
                           initWithObjects:@"Riverside-Downtown",
                           @"Riverside-La Sierra",
                           @"North Main Corona",
                           @"West Corona",
                           @"Fullerton", nil];
        self.octaServices = [[NSArray alloc]
                             initWithObjects:@"701",
                             @"701",
                             @"701",
                             @"701",
                             @"701", nil];
        self.octaTimes = [[NSArray alloc]
                          initWithObjects:@"5:29",
                          @"5:39",
                          @"5:47",
                          @"5:53",
                          @"6:18", nil];
       
        self.octaImages = [[NSArray alloc]
                           initWithObjects:@"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png", nil];
    }
    return self;
}


@end

