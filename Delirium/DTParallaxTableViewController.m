//
//  DTParallaxTableViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 20/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTParallaxTableViewController.h"


@interface DTParallaxTableViewController ()
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scroll:(UIScrollView *)scrollView background:(UIView*)backgroundView;
@end

@implementation DTParallaxTableViewController

@synthesize
backgroundView=mBackgroundView,
wrapperView=mWrapperView,
scrollView=mScrollView;


- (id)init {
    self = [super init];
    if (self) {
		
		CGRect frame = [[[UIApplication sharedApplication] keyWindow] frame];
		
		CGRect q = [[UIApplication sharedApplication] statusBarFrame];
		//NSLog(@"q %f,%f", q.size.height, q.size.width);
		
		frame.size.height -= q.size.height;
		
		if (self.navigationItem) {
			// frame.size.height -= self.navigationController.navigationBar.bounds.size.height; // Fuck Apple
			frame.size.height -= 44.0;
		}
		
		if (!self.wrapperView) {
			self.wrapperView = [[[UIView alloc] initWithFrame:frame] autorelease];
		}
		
		if (!self.backgroundView) {
			self.backgroundView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
			[self.wrapperView addSubview:self.backgroundView];
		}
    }
    
    return self;
}

- (void)dealloc {
	[mBackgroundView release];
	[mWrapperView release];
	[super dealloc];
}


#pragma mark - View lifecycle


/*
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)setView:(UIView *)view {
	view.backgroundColor = [UIColor clearColor];
	
	[self.scrollView removeFromSuperview];
	self.scrollView = (UIScrollView*)view;
	
	[self.wrapperView addSubview:view];
	view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height-44.0);
	
	super.view = self.wrapperView;
}


#pragma mark -
#pragma mark scollView delegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[self scroll:scrollView background:self.backgroundView];
}

- (void)scroll:(UIScrollView *)scrollView background:(UIView*)backgroundView {
	
	CGPoint p = scrollView.contentOffset;
	//CGSize c = self.contentView.frame.size;
	CGSize s = scrollView.frame.size;
	CGSize b = backgroundView.frame.size;
	
	CGRect r = backgroundView.frame;
	//r.origin.x = -kParallaxMarginX - p.x * (b.width-2*kParallaxMarginX - s.width) / s.width;
	//r.origin.y = -kParallaxMarginY - p.y * (b.height-2*kParallaxMarginY - s.height) / s.height;
	
	r.origin.x = - MIN(MAX(p.x * (b.width - s.width) / s.width, 0), b.width-s.width);
	r.origin.y = - MIN(MAX(p.y * (b.height - s.height) / s.height, 0), b.height-s.height);
	
	//NSLog(@"x %f,%f", (c.width - s.width), (b.width - c.width));
	//NSLog(@"y %f,%f", (c.height - s.height), (b.height - c.height));
	//NSLog(@"r origin %f,%f", r.origin.x, r.origin.y);
	
	backgroundView.frame = r;
}


#pragma mark -
#pragma mark parallax

- (void)setBackgroundImage:(UIImage*)image {
	//NSLog(@"image size %f,%f", image.size.width, image.size.height);
	self.backgroundView.image = image;
	self.backgroundView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[self scroll:self.scrollView background:self.backgroundView];
}

- (UIImage*)backgroundImage {
	return self.backgroundView.image;
}



@end
