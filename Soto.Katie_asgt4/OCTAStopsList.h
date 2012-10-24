//
//  OCTAStopsList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTADataSource.h"

@interface OCTAStopsList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString* routeName;
    IBOutlet UITableView *tableView;
    OCTADataSource *_octaData;
    NSArray *octaStops;
}

@property (nonatomic, retain) NSString* routeName;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) OCTADataSource *octaData;
@property (nonatomic, retain) NSArray *octaStops;


@end
