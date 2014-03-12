//
//  QBAssetsCollectionCheckmarkView.m
//  QBImagePickerController
//
//  Created by Tanaka Katsuma on 2014/01/01.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetsCollectionCheckmarkView.h"


#define lineWidth 1.2f
#define defaultCheckmarkRadius 12.0f
@implementation QBAssetsCollectionCheckmarkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // View settings
        self.backgroundColor = [UIColor clearColor];
        
        self.checkmarkBackgroundColor = [UIColor colorWithRed:20.0f/255.0f green:111.0f/255.0f blue:223.0f/255.0f alpha:1];
        self.checkmarkBorderColor = [UIColor whiteColor];
        self.checkmarkColor = [UIColor whiteColor];
        self.checkmarkRadius =defaultCheckmarkRadius;
    }
    
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    
    return CGSizeMake(_checkmarkRadius*2,_checkmarkRadius*2);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Border
    CGContextSetFillColorWithColor(context, self.checkmarkBorderColor.CGColor);
    CGContextFillEllipseInRect(context, self.bounds);
    
    // Body
    CGContextSetFillColorWithColor(context, self.checkmarkBackgroundColor.CGColor);
    CGContextFillEllipseInRect(context, CGRectInset(self.bounds, 1.0, 1.0));
    
    // Checkmark
    CGContextSetStrokeColorWithColor(context, self.checkmarkColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    
    
    CGContextMoveToPoint(context, self.checkmarkRadius/2.0f, self.checkmarkRadius);
    CGContextAddLineToPoint(context, self.checkmarkRadius*5.0f/6.0f, self.checkmarkRadius*4.0f/3.0f);
    CGContextAddLineToPoint(context, self.checkmarkRadius/2.0f*3.0f,self.checkmarkRadius*2.0f/3.0f);
    
    CGContextStrokePath(context);
}

@end
