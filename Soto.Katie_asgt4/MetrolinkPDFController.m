//
//  MetrolinkPDFController.m
//  Soto.Katie_asgt4
//
//  Created by Lion User on 23/10/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

/*RETRIEVED FROM APPLE*/

#import "MetrolinkPDFController.h"
#import "PDFScrollView.h"
#import <QuartzCore/QuartzCore.h> //MIGHT NOT NEED THIS

@implementation MetrolinkPDFController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     Open the PDF document, extract the first page, and pass the page to the PDF scroll view.
     */
    
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"Metrolink_All_Lines_timetable_9" withExtension:@"pdf"];
    
    CGPDFDocumentRef PDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
    
    CGPDFPageRef PDFPage = CGPDFDocumentGetPage(PDFDocument, 1);
    [(PDFScrollView *)self.view setPDFPage:PDFPage];
    
    CGPDFDocumentRelease(PDFDocument);
    
}


@end
