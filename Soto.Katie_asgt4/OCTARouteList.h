//
//  OCTARouteList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTADataSource.h"

@interface OCTARouteList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *octaRoutes;
    IBOutlet UITableView *tableView;
    OCTADataSource *_octaData;
}

@property (nonatomic, retain) NSArray *octaRoutes;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) OCTADataSource *octaData;

@end
