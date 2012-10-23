//
//  MetrolinkPDFScrollView.h
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

/* RETRIEVED FROM APPLE */

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MetrolinkPDFScrollView : UIScrollView <UIScrollViewDelegate>

- (void)setPDFPage:(CGPDFPageRef)PDFPage;

@end
