//Metrolink: Trying to use DYNAMIC cells
//

#import <UIKit/UIKit.h>
#import "MetrolinkDataSource.h"
#import "MetrolinkDetailViewController.h"

@interface MetrolinkTableController : UITableViewController
{
    
    NSArray *displayList;
    
    @private
    MetrolinkDataSource *_metroData;
    MetrolinkDetailViewController *_detailView;

}

@property (nonatomic, retain) NSArray *displayList;
@property (nonatomic, retain) MetrolinkDataSource *metroData;
@property (nonatomic, retain) MetrolinkDetailViewController *detailView;

@end
