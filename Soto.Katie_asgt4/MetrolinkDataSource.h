//
//  MetrolinkDataSource.h
//  Soto.Katie_asgt4
//
//  Created by Guest User on 10/22/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetrolinkDataSource : NSObject
{
    NSArray *octaCities;
    NSArray *octaImages;
    NSArray *octaTimes;
}

@property (nonatomic, strong) NSArray *octaCities;
@property (nonatomic, strong) NSArray *octaImages;
@property (nonatomic, strong) NSArray *octaTimes;

@end
