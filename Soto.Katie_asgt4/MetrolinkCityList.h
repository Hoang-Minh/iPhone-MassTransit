//
//  MetrolinkCityList.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetrolinkDataSource.h"


@interface MetrolinkCityList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *lineName;
    IBOutlet UITableView *tableView;
    MetrolinkDataSource *_metroData;
    NSArray *metroLinkCities;
}

@property (nonatomic, strong) NSString *lineName;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) MetrolinkDataSource *metroData;
@property (nonatomic, retain) NSArray *metroLinkCities;

@end
