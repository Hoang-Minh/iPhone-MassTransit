//
//  MetrolinkPDFTiledView.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

/* RETRIEVED FROM APPLE */

#import <UIKit/UIKit.h>

@interface MetrolinkPDFTiledView : UIView

- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)setPage:(CGPDFPageRef)newPage;

@end
