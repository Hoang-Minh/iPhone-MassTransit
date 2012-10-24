//OCTA: Trying to use STATIC cells
//

#import "OCTADataSource.h"

@implementation OCTADataSource

@synthesize octaRoutes;


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
    }
    return self;
}


@end

