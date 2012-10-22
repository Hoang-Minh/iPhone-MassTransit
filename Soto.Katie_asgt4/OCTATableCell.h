//
//  OCTATableCell.h
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OCTATableCell : UITableViewCell
{
    IBOutlet UIImageView *octaImage;
    IBOutlet UILabel *octaCity;
    IBOutlet UILabel *octaService;
    IBOutlet UILabel *octaTime;
    //int *octaLine;
    
@private
    //OCTADataSource* _dataSource;
    
}

@property (nonatomic, strong) IBOutlet UIImageView *octaImage;
@property (nonatomic, strong) IBOutlet UILabel *octaCity;
@property (nonatomic, strong) IBOutlet UILabel *octaService;
@property (nonatomic, strong) IBOutlet UILabel *octaTime;
//@property (assign) int *octaLine;
//@property (nonatomic, retain) OCTADataSource *dataSource;
@end
