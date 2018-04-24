//
//  pinchToZoomViewController.m
//  ScrollViewImages
//
//  Created by ruijia lin on 4/23/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "PinchToZoomViewController.h"

@interface PinchToZoomViewController () <UIScrollViewDelegate>
@property UIImageView *pinchImageView;
@end

@implementation PinchToZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor purpleColor];
    
    self.pinchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.pinchImageView.userInteractionEnabled = YES;
    self.pinchImageView.image = self.pinchImage;
    [self.scrollView setMinimumZoomScale:0.1];
    [self.scrollView setMaximumZoomScale:5];
    [self.scrollView addSubview:self.pinchImageView];
//    [self.view addSubview:self.scrollView];
//    [self.view addSubview:self.pinchImageView];
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.pinchImageView;
}

@end
