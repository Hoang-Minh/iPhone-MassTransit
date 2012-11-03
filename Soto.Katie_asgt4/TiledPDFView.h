//
//  TiledPDFView.h
//  Soto.Katie_asgt4
//
//  Author: Katie Soto
//  Project: iPhone Mass Transit Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 10/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone application that presents the user with a table
//      view containing information on the routes / lines of the OCTA and Metrolink
//      mass transit systems. The user must also be able to view the OCTA and Metrolink
//      pdf maps, and be able to scroll in and out.
//  File Description: This view is backed by a CATiledLayer into which the PDF page
//      is rendered into.
//
//  Copyright note: The contents of this file were retrieved from and modeled after:
//      Source: Apple Developer Network
//      Address: http://developer.apple.com/library/ios/#samplecode/ZoomingPDFViewer/Introduction/Intro.html
//      Date Retrieved: 10/2012
//      Copyright: © 2012 Apple Inc. All Rights Reserved.
//

#import <UIKit/UIKit.h>


@interface TiledPDFView : UIView

- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)setPage:(CGPDFPageRef)newPage;

@end
