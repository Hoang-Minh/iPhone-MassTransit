//Metrolink: Trying to use DYNAMIC cells
//

#import "MetrolinkDataSource.h"

@implementation MetrolinkDataSource

@synthesize metroLines;
@synthesize metroAntelopeValleyCities;
@synthesize metroBurbankCities;
@synthesize metroInlandCities;
@synthesize metroOrangeCities;
@synthesize metroRiversideCities;
@synthesize metroSanBernardinoCities;
@synthesize metroVenturaCities;
@synthesize metro91Cities;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        //complete
        self.metroLines = [[NSArray alloc]
                           initWithObjects:@"Antelope Valley",
                           @"Burbank-Bob Hope Airport",
                           @"Inland Empire - Orange County",
                           @"Riverside",
                           @"San Bernardino",
                           @"Ventura County",
                           @"91 Line", nil];
        
        //complete
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
        
        //complete
        self.metroBurbankCities = [[NSArray alloc]
                                          initWithObjects:@"Burbank-Bob Hope Airport",
                                          @"Downtown Burbank",
                                          @"Glendale",
                                          @"L.A. Union Station", nil];
        
        //complete
        self.metroInlandCities = [[NSArray alloc]
                                          initWithObjects:@"Oceanside",
                                          @"San Clemente Pier",
                                          @"San Clemente",
                                          @"San Juan Capistrano",
                                          @"Laguna Niguel / Mission Viejo",
                                          @"Irvine",
                                          @"Tustin",
                                          @"Santa Ana",
                                          @"Orange",
                                          @"Anaheim Canyon",
                                          @"West Corona",
                                          @"North Main Corona",
                                          @"Riverside-La Sierra",
                                          @"Riverside-Downtown",
                                          @"San Bernardino", nil];
        
        //complete
        self.metroOrangeCities = [[NSArray alloc]
                                  initWithObjects:@"Oceanside",
                                  @"San Clemente Pier",
                                  @"San Clemente",
                                  @"San Juan Capistrano",
                                  @"Laguna Niguel / Mission Viejo",
                                  @"Irvine",
                                  @"Tustin",
                                  @"Santa Ana",
                                  @"Orange",
                                  @"Anaheim",
                                  @"Fullerton",
                                  @"Buena Park",
                                  @"Norwalk / Santa Fe Springs",
                                  @"Commerce",
                                  @"L.A. Union Station", nil];
        
        //complete
        self.metroRiversideCities = [[NSArray alloc]
                                  initWithObjects:@"Riverside-Downtown",
                                  @"Pedley",
                                  @"East Ontario",
                                  @"Downtown Pomona",
                                  @"Industry",
                                  @"Montebello / Commerce",
                                  @"L.A. Union Station", nil];
        
        //complete
        self.metroSanBernardinoCities = [[NSArray alloc]
                                     initWithObjects:@"Riverside-Downtown",
                                     @"San Bernardino",
                                     @"Rialto",
                                     @"Fontana",
                                     @"Rancho Cucamonga",
                                     @"Upland",
                                     @"Montclair",
                                     @"Claremont",
                                     @"Pomona",
                                     @"Covina",
                                     @"Baldwin Park",
                                     @"El Monte",
                                     @"Cal State LA",
                                     @"L.A. Union Station", nil];
        
        //complete
        self.metroVenturaCities = [[NSArray alloc]
                                         initWithObjects:@"East Ventura",
                                         @"Oxnard",
                                         @"Camarillo",
                                         @"Moorpark",
                                         @"Simi Valley",
                                         @"Chatsworth",
                                         @"Northridge",
                                         @"Van Nuys",
                                         @"Burbank-Bob Hope Airport",
                                         @"Downtown Burbank",
                                         @"Glendale",
                                         @"L.A. Union Station", nil];
        
        //complete
        self.metro91Cities = [[NSArray alloc]
                                     initWithObjects:@"Riverside-Downtown",
                                     @"Riverside-La Sierra",
                                     @"North Main Corona",
                                     @"West Corona",
                                     @"Fullerton",
                                     @"Buena Park",
                                     @"Norwalk / Santa Fe Springs",
                                     @"L.A. Union Station", nil];
    
    }
    return self;
}


@end
