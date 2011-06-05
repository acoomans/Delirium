//
//  UIView+Fading.h
//  Delirium
//
//  Created by arnaud on 19/03/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kUIViewEaseVisibilityDuration 0.5

@interface UIView (Fading)

- (void)fadeIn;
- (void)fadeOut;

- (void)fadeInWithInterval:(NSTimeInterval)timeInterval curve:(UIViewAnimationCurve)curve;
- (void)fadeOutWithInterval:(NSTimeInterval)timeInterval curve:(UIViewAnimationCurve)curve;


@end
