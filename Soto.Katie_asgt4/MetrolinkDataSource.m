//Metrolink: Trying to use DYNAMIC cells
//

#import "MetrolinkDataSource.h"

@implementation MetrolinkDataSource

@synthesize metroCities;
@synthesize metroImages;
@synthesize metroTimes;

- (id) init
{
    self = [super init];
    if(self)
    {
        self.metroCities = [[NSArray alloc]
                           initWithObjects:
                           @"Riverside-Downtown",
                           @"Riverside-La Sierra",
                           @"North Main Corona",
                           @"West Corona",
                           @"Fullerton", nil];
        

        self.metroImages = [[NSArray alloc]
                           initWithObjects:
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png", nil];
        
        self.metroTimes = [[NSArray alloc]
                           initWithObjects:
                           @"5:29",
                           @"5:39",
                           @"5:47",
                           @"5:53",
                           @"6:18", nil];
        
    }
    return self;
}


@end
