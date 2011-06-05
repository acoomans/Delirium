//
//  UIView+Fading.m
//  Delirium
//
//  Created by arnaud on 19/03/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "UIView+Fading.h"


@implementation UIView (Fading)



- (void)fadeIn {
	[self fadeInWithInterval:kUIViewEaseVisibilityDuration curve:UIViewAnimationCurveEaseIn];
}


- (void)fadeOut {
	[self fadeOutWithInterval:kUIViewEaseVisibilityDuration curve:UIViewAnimationCurveEaseOut];
}


- (void)fadeInWithInterval:(NSTimeInterval)timeInterval curve:(UIViewAnimationCurve)curve {
	if (self.hidden == YES || self.alpha == 0.0) {
		self.alpha = 0.0;
		self.hidden = NO;
		
		[UIView beginAnimations:@"fadeIn" context:NULL];
		[UIView setAnimationDuration:timeInterval];
		[UIView setAnimationCurve:curve];
		self.alpha = 1.0;
		[UIView commitAnimations];
	}
}

- (void)fadeOutWithInterval:(NSTimeInterval)timeInterval curve:(UIViewAnimationCurve)curve {
	if (!(self.hidden == YES || self.alpha == 0.0)) {
		self.alpha = 1.0;
		
		[UIView beginAnimations:@"fadeOut" context:NULL];
		[UIView setAnimationDuration:timeInterval];
		[UIView setAnimationCurve:curve];
		self.alpha = 0.0;
		[UIView commitAnimations];
	}
}


@end
