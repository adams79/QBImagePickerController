//
//  QBAssetsCollectionOverlayView.m
//  QBImagePickerController
//
//  Created by Tanaka Katsuma on 2014/01/01.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetsCollectionOverlayView.h"
#import <QuartzCore/QuartzCore.h>

// Views
#import "QBAssetsCollectionCheckmarkView.h"

#define checkmarkSize 24.0f
#define checkmarkPadding 4.0f

@interface QBAssetsCollectionOverlayView ()

@property (nonatomic, strong) QBAssetsCollectionCheckmarkView *checkmarkView;

@end

@implementation QBAssetsCollectionOverlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // View settings
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.4];
        
        // Create a checkmark view
        QBAssetsCollectionCheckmarkView *checkmarkView = [[QBAssetsCollectionCheckmarkView alloc] initWithFrame:CGRectMake(self.bounds.size.width - (checkmarkPadding + checkmarkSize), self.bounds.size.height - (checkmarkPadding + checkmarkSize), checkmarkSize, checkmarkSize)];
        checkmarkView.checkmarkRadius = checkmarkSize/2.0f;
        checkmarkView.autoresizingMask = UIViewAutoresizingNone;
        
//        checkmarkView.layer.shadowColor = [[UIColor grayColor] CGColor];
//        checkmarkView.layer.shadowOffset = CGSizeMake(0, 0);
//        checkmarkView.layer.shadowOpacity = 0.6;
//        checkmarkView.layer.shadowRadius = 2.0;
//        checkmarkView.layer.shadowPath = [[UIBezierPath
//                                           bezierPathWithRect:self.bounds] CGPath];
        
        [self addSubview:checkmarkView];
        self.checkmarkView = checkmarkView;
    }
    
    return self;
}

@end
