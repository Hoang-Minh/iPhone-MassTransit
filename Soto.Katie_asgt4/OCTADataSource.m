//OCTA: Trying to use STATIC cells
//

#import "OCTADataSource.h"

@implementation OCTADataSource

@synthesize octaRoutes;
@synthesize octaRoutesFull;
@synthesize octaPDFsFull;

//***********************************************
- (id) init
{
    self = [super init];
    if(self)
    {
        self.octaRoutes = [[NSArray alloc]
                           initWithObjects:@"59",
                           @"57",
                           @"42", nil];
        self.octaRoutesFull = [[NSMutableArray alloc] init];
        self.octaPDFsFull = [[NSMutableArray alloc] init];
        
//GET ROUTE NAMES AND PDF URLS FROM THE TEXT FILE:
        //open the "routes" file...
        NSString *string = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"routes" ofType:@"txt"]];
        //seperate based on new lines and commas
        NSArray *arrayNewLines = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n,"]];
        NSString *cleanedString = [[NSString alloc] init];
        //Every 9th element is the route name. For example, these are route names: objectAtIndex: 3, 12, 21, 30, 39,...
        //Every 9th element is the route pdf url. For example, these are route pdf urls: objectAtIndex: 15, 24, 33, 42...
        //SO, put together, we need these elements:
        //12
        //15
        //21
        //24
        //...
        //The following loop will extract the needed elements and put them in 2 different corresponding arrays.
        NSLog(@"count: %u", [arrayNewLines count]);
        int i = 12;
        while(i<694)
        {
            if([arrayNewLines objectAtIndex:i])
            {
                //ROUTE NAME
                //first strip it of the extra quotations:
                cleanedString = [[arrayNewLines objectAtIndex:i] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"\""]];
                //now put the cleaned string in the routes array
                [self.octaRoutesFull addObject:cleanedString];
            }
            i=i+3;
            if([arrayNewLines objectAtIndex:i])
            {
                //PDF NAMES
                //first strip it of the extra quotations:
                cleanedString = [[arrayNewLines objectAtIndex:i] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"\""]];
                //now put the cleaned string in the routes array
                [self.octaPDFsFull addObject:cleanedString];
            }
            i=i+6;
        }
    }
    return self;
}


@end

