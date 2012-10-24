//OCTA: Trying to use STATIC cells
//

#import <Foundation/Foundation.h>

@interface OCTADataSource : NSObject
{
    NSArray *octaRoutes;
    NSMutableArray *octaRoutesFull;
    NSMutableArray *octaPDFsFull;
}

@property (nonatomic, retain) NSArray *octaRoutes;
@property (nonatomic, retain) NSMutableArray *octaRoutesFull;
@property (nonatomic, retain) NSMutableArray *octaPDFsFull;

@end
