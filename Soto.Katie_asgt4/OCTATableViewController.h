//OCTA: Trying to use STATIC cells
//

#import <UIKit/UIKit.h>
#import "OCTADataSource.h"
#import "OCTATableCell.h"

@interface OCTATableViewController : UITableViewController
{
    OCTADataSource *_dataSource;
    OCTATableCell *_tableCell;
}

@property (nonatomic, retain) OCTADataSource *dataSource;
@property (nonatomic, retain) OCTATableCell *tableCell;

@end