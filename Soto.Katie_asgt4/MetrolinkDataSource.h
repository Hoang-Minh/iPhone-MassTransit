//Metrolink: Trying to use DYNAMIC cells
//

#import <Foundation/Foundation.h>

@interface MetrolinkDataSource : NSObject
{
    NSArray *metroLines;
    NSArray *metroAntelopeValleyCities;
    NSArray *metroBurbankCities;
    NSArray *metroInlandCities;
    NSArray *metroOrangeCities;
    NSArray *metroRiversideCities;
    NSArray *metroSanBernardinoCities;
    NSArray *metroVenturaCities;
    NSArray *metro91Cities;
}

@property (nonatomic, strong) NSArray *metroLines;
@property (nonatomic, strong) NSArray *metroAntelopeValleyCities;
@property (nonatomic, strong) NSArray *metroBurbankCities;
@property (nonatomic, strong) NSArray *metroInlandCities;
@property (nonatomic, strong) NSArray *metroOrangeCities;
@property (nonatomic, strong) NSArray *metroRiversideCities;
@property (nonatomic, strong) NSArray *metroSanBernardinoCities;
@property (nonatomic, strong) NSArray *metroVenturaCities;
@property (nonatomic, strong) NSArray *metro91Cities;

@end
