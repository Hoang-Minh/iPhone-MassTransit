//
//  TiledPDFView.m
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

#import "TiledPDFView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TiledPDFView
{
    CGPDFPageRef pdfPage;
    CGFloat myScale;
}


// Create a new TiledPDFView with the desired frame and scale.
- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
        /*
         levelsOfDetail and levelsOfDetailBias determine how the layer is rendered at different zoom levels. This only matters while the view is zooming, because once the the view is done zooming a new TiledPDFView is created at the correct size and scale.
         */
        tiledLayer.levelsOfDetail = 4;
        tiledLayer.levelsOfDetailBias = 3;
        tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
        
        myScale = scale;
    }
    return self;
}


// The layer's class should be CATiledLayer.
+ (Class)layerClass
{
    return [CATiledLayer class];
}


// Set the CGPDFPageRef for the view.
- (void)setPage:(CGPDFPageRef)newPage
{
    CGPDFPageRelease(self->pdfPage);
    self->pdfPage = CGPDFPageRetain(newPage);
}


-(void)drawRect:(CGRect)r
{
    /*
     UIView uses the existence of -drawRect: to determine if it should allow its CALayer to be invalidated, which would then lead to the layer creating a backing store and -drawLayer:inContext: being called.
     Implementing an empty -drawRect: method allows UIKit to continue to implement this logic, while doing the real drawing work inside of -drawLayer:inContext:.
     */
}


// Draw the CGPDFPageRef into the layer at the correct scale.
-(void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context
{
    // Fill the background with white.
    CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
    CGContextFillRect(context, self.bounds);
    
    CGContextSaveGState(context);
    // Flip the context so that the PDF page is rendered right side up.
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Scale the context so that the PDF page is rendered at the correct size for the zoom level.
    CGContextScaleCTM(context, myScale, myScale);
    CGContextDrawPDFPage(context, pdfPage);
    CGContextRestoreGState(context);
}


// Clean up.
- (void)dealloc
{
    CGPDFPageRelease(pdfPage);
}


@end

