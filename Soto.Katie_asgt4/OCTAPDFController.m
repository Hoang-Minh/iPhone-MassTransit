//
//  OCTAPDFController.m
//  Soto.Katie_asgt4
//
//  Created by CS User on 10/24/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "OCTAPDFController.h"
#import "PDFScrollView.h"
#import <QuartzCore/QuartzCore.h> //MIGHT NOT NEED THIS

@interface OCTAPDFController ()

@end

@implementation OCTAPDFController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     Open the PDF document, extract the first page, and pass the page to the PDF scroll view.
     */
    
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"sysmapjune12" withExtension:@"pdf"];
    
    CGPDFDocumentRef PDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
    
    CGPDFPageRef PDFPage = CGPDFDocumentGetPage(PDFDocument, 1);
    [(PDFScrollView *)self.view setPDFPage:PDFPage];
    
    CGPDFDocumentRelease(PDFDocument);
    
}

@end
