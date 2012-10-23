//Metrolink: Trying to use DYNAMIC cells
//

#import "MetrolinkDataSource.h"

@implementation MetrolinkDataSource

@synthesize metroCities;
@synthesize metroImages;
@synthesize metroTimes;
@synthesize metroAntelopeValleyCities;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        self.metroCities = [[NSArray alloc]
                           initWithObjects:@"Riverside-Downtown",
                           @"Riverside-La Sierra",
                           @"North Main Corona",
                           @"West Corona",
                           @"Fullerton", nil];
        

        self.metroImages = [[NSArray alloc]
                           initWithObjects:@"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png",
                           @"12-6AM.png", nil];
        
        self.metroTimes = [[NSArray alloc]
                           initWithObjects:@"5:29",
                           @"5:39",
                           @"5:47",
                           @"5:53",
                           @"6:18", nil];
        
        //complete
        self.metroLines = [[NSArray alloc]
                           initWithObjects:@"Antelope Valley",
                           @"Burbank-Bob Hope Airport",
                           @"Inland Empire - Orange County",
                           @"Riverside",
                           @"San Bernardino",
                           @"Ventura County",
                           @"91 Line", nil];
        
        self.metroAntelopeValleyCities = [[NSArray alloc]
                                          initWithObjects:@"Lancaster",
                                          @"Palmdale",
                                          @"Vincent Grade / Action",
                                          @"Via Princessa",
                                          @"Santa Clarita",
                                          @"Newhall",
                                          @"Sylmar / San Fernando",
                                          @"Sun Valley",
                                          @"Downtown Burbank",
                                          @"Glendale",
                                          @"L.A. Union Station", nil];
        
        
    }
    return self;
}


@end
