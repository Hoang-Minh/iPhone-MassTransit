//
//  ViewController.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 19/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetrolinkTableController.h"
#import "OCTATableViewController.h"

@interface ViewController : UIViewController
{
    @private
        MetrolinkTableController* _metroController;
    
    //Maybe I need to add some of these to get the navigation bar working:
    //UINavigationBar
    //UINavigationItem
    //UINavigationController
}
@property (nonatomic, retain) MetrolinkTableController* metroController;

@end
