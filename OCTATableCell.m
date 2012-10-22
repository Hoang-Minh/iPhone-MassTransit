//
//  OCTATableCell.m
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTATableCell.h"

@implementation OCTATableCell

@synthesize octaCity;
@synthesize octaImage;
//@synthesize octaLine;
@synthesize octaService;
@synthesize octaTime;
//@synthesize dataSource = _dataSource;

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
