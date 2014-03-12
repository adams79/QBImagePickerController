//
//  QBAssetsCollectionViewCell.m
//  QBImagePickerController
//
//  Created by Tanaka Katsuma on 2013/12/31.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetsCollectionViewCell.h"

// Views
#import "QBAssetsCollectionOverlayView.h"

@interface QBAssetsCollectionViewCell ()
@property (nonatomic,strong) UIImageView *videoIconImageView;
@property (nonatomic,strong) UILabel *lblDuration;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) QBAssetsCollectionOverlayView *overlayView;

@end

@implementation QBAssetsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.showsOverlayViewWhenSelected = YES;
        
        // Create a image view
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.videoIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4, self.contentView.frame.size.height-12, 15, 8)];
        self.videoIconImageView.image = [UIImage imageNamed:@"videoIcon"];
        
        self.lblDuration = [[UILabel alloc] initWithFrame:CGRectMake(4, self.contentView.frame.size.height-14, self.contentView.frame.size.width-8, 12)];
        [self.lblDuration setFont:[UIFont systemFontOfSize:12]];
        [self.lblDuration setHidden:YES];
        [self.lblDuration setTextColor:[UIColor whiteColor]];
        [self.lblDuration setTextAlignment:NSTextAlignmentRight];
        
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:self.videoIconImageView];
        [self.contentView addSubview:self.lblDuration];

        
        self.imageView = imageView;
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    // Show/hide overlay view
    if (selected && self.showsOverlayViewWhenSelected) {
        [self hideOverlayView];
        [self showOverlayView];
    } else {
        [self hideOverlayView];
    }
}

- (void)showOverlayView
{
    QBAssetsCollectionOverlayView *overlayView = [[QBAssetsCollectionOverlayView alloc] initWithFrame:self.contentView.bounds];
    overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.contentView addSubview:overlayView];
    self.overlayView = overlayView;
}

- (void)hideOverlayView
{
    [self.overlayView removeFromSuperview];
    self.overlayView = nil;
}


#pragma mark - Accessors

- (void)setAsset:(ALAsset *)asset
{
    _asset = asset;
    
    // Update view
    self.imageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
    
    if ([[asset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
        NSNumber *duration = [asset valueForProperty:ALAssetPropertyDuration];
        self.lblDuration.text = [self stringFromSeconds:duration.intValue];
        [self.videoIconImageView setHidden:NO];
        [self.lblDuration setHidden:NO];
    }
    else
    {
        [self.videoIconImageView setHidden:YES];
        [self.lblDuration setHidden:YES];
    }
    
}
- (NSString *)stringFromSeconds:(int)secondsCount {
    NSInteger ti = secondsCount;
    int seconds = ti % 60;
    int minutes = (ti / 60) % 60;
    int hours = (int)(ti / 3600);
    if (hours>0) {
        return [NSString stringWithFormat:@"%i:%02i:%02i", hours, minutes, seconds];
    }
    else {
        return [NSString stringWithFormat:@"%i:%02i", minutes, seconds];
    }
}
@end
