//
//  TestController.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *metroLinkLines;
}

@property (nonatomic, retain) NSArray *metroLinkLines;

@end
