//
//  OCTATableViewController.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 19/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
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