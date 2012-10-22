//OCTA: Trying to use STATIC cells
//

#import <Foundation/Foundation.h>

@interface OCTADataSource : NSObject
{
    NSArray *octaCities;
    NSArray *octaServices;
    NSArray *octaTimes;
    NSArray *octaImages;
}

@property (nonatomic, retain) NSArray *octaCities;
@property (nonatomic, retain) NSArray *octaServices;
@property (nonatomic, retain) NSArray *octaTimes;
@property (nonatomic, retain) NSArray *octaImages;

@end
