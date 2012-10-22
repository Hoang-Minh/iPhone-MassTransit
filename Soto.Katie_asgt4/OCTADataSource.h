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

@property (nonatomic, strong) NSArray *octaCities;
@property (nonatomic, strong) NSArray *octaServices;
@property (nonatomic, strong) NSArray *octaTimes;
@property (nonatomic, strong) NSArray *octaImages;

@end
