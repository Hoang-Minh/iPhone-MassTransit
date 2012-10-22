//OCTA: Trying to use STATIC cells
//

#import <UIKit/UIKit.h>


@interface OCTATableCell : UITableViewCell
{
    IBOutlet UIImageView *octaImage;
    IBOutlet UILabel *octaCity;
    IBOutlet UILabel *octaService;
    IBOutlet UILabel *octaTime;
    
}

@property (nonatomic, strong) IBOutlet UIImageView *octaImage;
@property (nonatomic, strong) IBOutlet UILabel *octaCity;
@property (nonatomic, strong) IBOutlet UILabel *octaService;
@property (nonatomic, strong) IBOutlet UILabel *octaTime;
@end
