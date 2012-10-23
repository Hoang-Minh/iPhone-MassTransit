//Metrolink: Trying to use DYNAMIC cells
//

#import <Foundation/Foundation.h>

@interface MetrolinkDataSource : NSObject
{
    NSArray *metroCities;
    NSArray *metroImages;
    NSArray *metroTimes;
    NSArray *metroLines;
    NSArray *metroAntelopeValleyCities;
}

@property (nonatomic, strong) NSArray *metroCities;
@property (nonatomic, strong) NSArray *metroImages;
@property (nonatomic, strong) NSArray *metroTimes;
@property (nonatomic, strong) NSArray *metroLines;
@property (nonatomic, strong) NSArray *metroAntelopeValleyCities;

@end
