//
//  pinchToZoomViewController.h
//  ScrollViewImages
//
//  Created by ruijia lin on 4/23/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinchToZoomViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIImageView *pinchImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImage *pinchImage;
@end
