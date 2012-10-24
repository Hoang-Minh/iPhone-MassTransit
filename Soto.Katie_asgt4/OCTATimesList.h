//
//  OCTATimesList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTADataSource.h"

@interface OCTATimesList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *stopName;
    IBOutlet UITableView *tableView;
    OCTADataSource *_octaData;
    NSArray *octaTimes;
}

@property (nonatomic, retain) NSString *stopName;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) OCTADataSource *octaData;
@property (nonatomic, retain) NSArray *octaTimes;
@end
