//
//  ViewController.m
//  DrawingAndAnimationDemo
//
//  Created by admin on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)enumerateFonts;
- (void)getColorNumberOfComponents:(UIColor *)color;
- (void)startTopLeftImageViewAnimation;
- (void)startBottomRightViewAnimationAfterDelay:(CGFloat)parmDelay;
- (void)animationZoomIn;
- (void)clockRotationAnimation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 枚举 系统字体
    //[self enumerateFonts];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // 获取颜色 色彩分量
    //UIColor *steelBlueColor = [UIColor colorWithRed:0.3f green:0.4f blue:0.6f alpha:1.0f];
    //[self getColorNumberOfComponents:steelBlueColor];

    /*
    [UIView beginAnimations:@"ImageViewAnimation" context:imgView];
    //[UIView setAnimationRepeatCount:3.0f];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop:finished:context:)];
    imgView.frame = CGRectMake(200.0f, 350.0f, 100.0f, 100.0f);
    [UIView commitAnimations];
     */
    
    //[self startTopLeftImageViewAnimation];
    //[self startBottomRightViewAnimationAfterDelay:2.0f];
    
    //[self animationZoomIn];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}




#pragma mark UIFont methods
- (void)enumerateFonts {

    for(NSString *familyName in [UIFont familyNames]) {
        NSLog(@"Font Family = %@", familyName);
        
        for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"\t%@", fontName);
        }
    }

}

#pragma mark UIColor methods
- (void)getColorNumberOfComponents:(UIColor *)color {

    CGColorRef colorRef = [color CGColor];
    const CGFloat *components = CGColorGetComponents(colorRef);
    NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
    
    for(NSUInteger i = 0; i < componentsCount; i++){
        NSLog(@"Component %lu = %0.02f", (unsigned long)i+1, components[i]);
    }
}


#pragma mark - Animtation methods
- (void)imageViewDidStop:(NSString *)paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext {

    BOOL finished = [paramFinished boolValue];
    if(!finished) {
        NSLog(@"Animation Interupted.");
    }
    
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", paramAnimationID);
    UIImageView *contextImgView = (UIImageView *)paramContext;
    NSLog(@"Image View = %@",contextImgView);
    [contextImgView removeFromSuperview];

}

- (void)startTopLeftImageViewAnimation {
    [UIView beginAnimations:@"ImageViewAnimation" context:imgView];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop:finished:context:)];
    imgView.frame = CGRectMake(200.0f, 350.0f, 100.0f, 100.0f);
    [UIView commitAnimations];
}

- (void)startBottomRightViewAnimationAfterDelay:(CGFloat)parmDelay {
    imgView2.frame = CGRectMake(200.0f, 350.0f, 100.0f, 100.0f);
    [imgView2 setAlpha:1.0f];
    [UIView beginAnimations:@"ImageView2Animation" context:imgView2];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelay:3.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop:finished:context:)];
    imgView2.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    [UIView commitAnimations];
}

- (void)animationZoomIn {
    imgView.center = self.view.center;
    
    imgView.transform = CGAffineTransformIdentity;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.15f];
    imgView.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    [UIView commitAnimations];
}

- (IBAction)click:(id)sender {
    //[self animationZoomIn];
    [self clockRotationAnimation];
}

- (void)clockRotationAnimation {
    
    imgView.center = self.view.center;
    
    [UIView beginAnimations:@"clockRotationAnimation" context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(clockRotationAnimationStopped:finished:context:)];
    imgView.transform = CGAffineTransformMakeRotation((90.0f*M_PI)/180.0f);
    [UIView commitAnimations];
    
}

- (void)clockRotationAnimationStopped:(NSString *)paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext {
    
    [UIView beginAnimations:@"clockRotationAnimationReverse" context:NULL];
    [UIView setAnimationDelay:1.0f];
    [UIView setAnimationDuration:5.0f];
    imgView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
    
}

@end
