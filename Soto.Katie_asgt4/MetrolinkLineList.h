//
//  MetrolinkLineList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetrolinkCityList.h"
#import "MetrolinkDataSource.h"

@interface MetrolinkLineList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *metroLinkLines;
    IBOutlet UITableView *tableView;
    MetrolinkDataSource *_metroData;
}

@property (nonatomic, retain) NSArray *metroLinkLines;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) MetrolinkDataSource *metroData;

@end
