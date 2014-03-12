//
//  QBAssetsCollectionFooterView.m
//  QBImagePickerController
//
//  Created by Tanaka Katsuma on 2013/12/31.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetsCollectionFooterView.h"
#define labelHeight 21.0f
#define defaultFontSize 17
@interface QBAssetsCollectionFooterView ()

@property (nonatomic, strong, readwrite) UILabel *textLabel;

@end

@implementation QBAssetsCollectionFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Create a label
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textLabel.font = [UIFont systemFontOfSize:defaultFontSize];
        textLabel.textColor = [UIColor blackColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:textLabel];
        self.textLabel = textLabel;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Layout text label
    self.textLabel.frame = CGRectMake(0,(self.bounds.size.height - labelHeight) / 2.0,self.bounds.size.width, labelHeight);
}

@end
