//
//  PDFScrollView.m
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
//  File Description: This file is a UIScrollView subclass that handles the user input
//      to zoom the PDF page.  This class handles swapping the TiledPDFViews when the
//      zoom level changes.
//
//  Copyright note: The contents of this file were retrieved from and modeled after:
//      Source: Apple Developer Network
//      Address: http://developer.apple.com/library/ios/#samplecode/ZoomingPDFViewer/Introduction/Intro.html
//      Date Retrieved: 10/2012
//      Copyright: © 2012 Apple Inc. All Rights Reserved.
//

#import "PDFScrollView.h"
#import "TiledPDFView.h"
#import <QuartzCore/QuartzCore.h>


@interface PDFScrollView ()

// A low resolution image of the PDF page that is displayed until the TiledPDFView renders its content.
@property (nonatomic, weak) UIImageView *backgroundImageView;

// The TiledPDFView that is currently front most.
@property (nonatomic, weak) TiledPDFView *tiledPDFView;

// The old TiledPDFView that we draw on top of when the zooming stops.
@property (nonatomic, weak) TiledPDFView *oldTiledPDFView;

@end



@implementation PDFScrollView
{
    CGPDFPageRef _PDFPage;
    
    // Current PDF zoom scale.
    CGFloat _PDFScale;
}


@synthesize backgroundImageView=_backgroundImageView, tiledPDFView=_tiledPDFView, oldTiledPDFView=_oldTiledPDFView;


- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;
    }
    return self;
}


- (void)setPDFPage:(CGPDFPageRef)PDFPage;
{
    CGPDFPageRetain(PDFPage);
    CGPDFPageRelease(_PDFPage);
    _PDFPage = PDFPage;
    
    // Determine the size of the PDF page.
    CGRect pageRect = CGPDFPageGetBoxRect(_PDFPage, kCGPDFMediaBox);
    _PDFScale = self.frame.size.width/pageRect.size.width;
    pageRect.size = CGSizeMake(pageRect.size.width*_PDFScale, pageRect.size.height*_PDFScale);
    
    
    /*
     Create a low resolution image representation of the PDF page to display before the TiledPDFView renders its content.
     */
    UIGraphicsBeginImageContext(pageRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // First fill the background with white.
    CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
    CGContextFillRect(context,pageRect);
    
    CGContextSaveGState(context);
    // Flip the context so that the PDF page is rendered right side up.
    CGContextTranslateCTM(context, 0.0, pageRect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Scale the context so that the PDF page is rendered at the correct size for the zoom level.
    CGContextScaleCTM(context, _PDFScale,_PDFScale);
    CGContextDrawPDFPage(context, _PDFPage);
    CGContextRestoreGState(context);
    
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    if (self.backgroundImageView != nil) {
        [self.backgroundImageView removeFromSuperview];
    }
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backgroundImageView.frame = pageRect;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:backgroundImageView];
    [self sendSubviewToBack:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    
    // Create the TiledPDFView based on the size of the PDF page and scale it to fit the view.
    TiledPDFView *tiledPDFView = [[TiledPDFView alloc] initWithFrame:pageRect scale:_PDFScale];
    [tiledPDFView setPage:_PDFPage];
    
    [self addSubview:tiledPDFView];
    self.tiledPDFView = tiledPDFView;
}


- (void)dealloc
{
    // Clean up.
    CGPDFPageRelease(_PDFPage);
}


#pragma mark -
#pragma mark Override layoutSubviews to center content

// Use layoutSubviews to center the PDF page in the view.
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Center the image as it becomes smaller than the size of the screen.
    
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = self.tiledPDFView.frame;
    
    // Center horizontally.
    
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // Center vertically.
    
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    self.tiledPDFView.frame = frameToCenter;
    self.backgroundImageView.frame = frameToCenter;
    
    /*
     To handle the interaction between CATiledLayer and high resolution screens, set the tiling view's contentScaleFactor to 1.0.
     If this step were omitted, the content scale factor would be 2.0 on high resolution screens, which would cause the CATiledLayer to ask for tiles of the wrong scale.
     */
    self.tiledPDFView.contentScaleFactor = 1.0;
}


#pragma mark -
#pragma mark UIScrollView delegate methods

/*
 A UIScrollView delegate callback, called when the user starts zooming.
 Return the current TiledPDFView.
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.tiledPDFView;
}

/*
 A UIScrollView delegate callback, called when the user begins zooming.
 When the user begins zooming, remove the old TiledPDFView and set the current TiledPDFView to be the old view so we can create a new TiledPDFView when the zooming ends.
 */
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    // Remove back tiled view.
    [self.oldTiledPDFView removeFromSuperview];
    
    // Set the current TiledPDFView to be the old view.
    self.oldTiledPDFView = self.tiledPDFView;
    [self addSubview:self.oldTiledPDFView];
}


/*
 A UIScrollView delegate callback, called when the user stops zooming.
 When the user stops zooming, create a new TiledPDFView based on the new zoom level and draw it on top of the old TiledPDFView.
 */
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    // Set the new scale factor for the TiledPDFView.
    _PDFScale *= scale;
    
    // Calculate the new frame for the new TiledPDFView.
    CGRect pageRect = CGPDFPageGetBoxRect(_PDFPage, kCGPDFMediaBox);
    pageRect.size = CGSizeMake(pageRect.size.width*_PDFScale, pageRect.size.height*_PDFScale);
    
    // Create a new TiledPDFView based on new frame and scaling.
    TiledPDFView *tiledPDFView = [[TiledPDFView alloc] initWithFrame:pageRect scale:_PDFScale];
    [tiledPDFView setPage:_PDFPage];
    
    // Add the new TiledPDFView to the PDFScrollView.
    [self addSubview:tiledPDFView];
    self.tiledPDFView = tiledPDFView;
}


@end

