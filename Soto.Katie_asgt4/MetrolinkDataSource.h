//Metrolink: Trying to use DYNAMIC cells
//

#import <Foundation/Foundation.h>

@interface MetrolinkDataSource : NSObject
{
    NSArray *metroCities;
    NSArray *metroImages;
    NSArray *metroTimes;
}

@property (nonatomic, strong) NSArray *metroCities;
@property (nonatomic, strong) NSArray *metroImages;
@property (nonatomic, strong) NSArray *metroTimes;

@end
