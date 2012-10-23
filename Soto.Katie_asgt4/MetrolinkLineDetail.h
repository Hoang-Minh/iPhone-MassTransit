//
//  MetrolinkLineDetail.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetrolinkLineDetail : UIViewController
{
    UILabel *lineLabel;
    NSString *lineName;
}

@property (nonatomic, strong) IBOutlet UILabel *lineLabel;
@property (nonatomic, strong) NSString *lineName;

@end
