//OCTA: Trying to use STATIC cells
//

#import "OCTATableCell.h"

@implementation OCTATableCell

@synthesize octaCity;
@synthesize octaImage;
@synthesize octaService;
@synthesize octaTime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
