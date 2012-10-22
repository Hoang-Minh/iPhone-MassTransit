//
//  MetrolinkDetailViewController.h
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetrolinkDataSource.h"

@interface MetrolinkDetailViewController : UIViewController
{
    IBOutlet UIImageView *metroImage;
    IBOutlet UILabel *metroCity;
    IBOutlet UILabel *metroTime;
}

@property (nonatomic, strong) IBOutlet UIImageView *metroImage;
@property (nonatomic, strong) IBOutlet UILabel *metroCity;
@property (nonatomic, strong) IBOutlet UILabel *metroTime;

@end
