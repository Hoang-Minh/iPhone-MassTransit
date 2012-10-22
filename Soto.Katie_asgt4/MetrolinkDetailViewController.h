//Metrolink: Trying to use DYNAMIC cells
//

#import <UIKit/UIKit.h>
#import "MetrolinkDataSource.h"

@interface MetrolinkDetailViewController : UIViewController
{
    IBOutlet UIImageView *metroImage;
    IBOutlet UILabel *metroCity;
    IBOutlet UILabel *metroTime;
    
    @private
    MetrolinkDataSource *_metroData;
}

@property (nonatomic, strong) IBOutlet UIImageView *metroImage;
@property (nonatomic, strong) IBOutlet UILabel *metroCity;
@property (nonatomic, strong) IBOutlet UILabel *metroTime;

@property (nonatomic, retain) MetrolinkDataSource *metroData;

@end
