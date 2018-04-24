//
//  ViewController.m
//  ScrollViewImages
//
//  Created by ruijia lin on 4/23/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollImageView;
@property UIImageView *tappedImageView;
@property UIImageView *imageView1;
@property UIImageView *imageView2;
@property UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectImageToZoom:)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectImageToZoom:)];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectImageToZoom:)];
    
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.imageView1.image = [UIImage imageNamed:@"Lighthouse"];
    self.imageView2.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    self.imageView3.image = [UIImage imageNamed:@"Lighthouse-night"];
    
    [self.imageView1 addGestureRecognizer:tap1];
    [self.imageView2 addGestureRecognizer:tap2];
    [self.imageView3 addGestureRecognizer:tap3];
    
    self.imageView1.userInteractionEnabled = YES;
    self.imageView2.userInteractionEnabled = YES;
    self.imageView3.userInteractionEnabled = YES;
    
    self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView2.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView3.contentMode = UIViewContentModeScaleAspectFit;
    
    CGFloat offset = self.imageView1.frame.size.width + self.imageView2.frame.size.width + self.imageView3.frame.size.width;
    self.scrollImageView.contentSize = CGSizeMake(offset, 0);
    
    self.scrollImageView.scrollEnabled = YES;
    self.scrollImageView.pagingEnabled = YES;
    
    [self.scrollImageView addSubview:self.imageView3];
    [self.scrollImageView addSubview:self.imageView2];
    [self.scrollImageView addSubview:self.imageView1];
    
}

-(void)selectImageToZoom:(UITapGestureRecognizer *)sender{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PinchToZoomViewController *pinchVC = [sb instantiateViewControllerWithIdentifier:@"pinchId"];
    
    if (sender.view.frame.origin.x > self.view.frame.origin.x * 3){
        pinchVC.pinchImage = self.imageView3.image;
    }else if (sender.view.frame.origin.x > self.view.frame.origin.x * 2){
        pinchVC.pinchImage = self.imageView2.image;
        
    }else {
        pinchVC.pinchImage = self.imageView1.image;
        
    }
    [self presentViewController:pinchVC animated:YES completion:nil];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
}
@end
