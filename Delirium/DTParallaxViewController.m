//
//  DTParallaxViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTParallaxViewController.h"


#define kParallaxMarginX 320.0
#define kParallaxMarginY 480.0

@interface DTParallaxViewController ()
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scroll:(UIScrollView *)scrollView background:(UIView*)backgroundView;
@end

@implementation DTParallaxViewController

@synthesize
backgroundView=mBackgroundView,
scrollView=mScrollView,
wrapperView=mWrapperView,
contentView=mContentView;


- (id)init {
    self = [super init];
    if (self) {
		NSLog(@"init");
		
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
		
		if (!self.scrollView) {
			self.scrollView = [[[UIScrollView alloc] initWithFrame:frame] autorelease];
			[self.wrapperView addSubview:self.scrollView];
			self.scrollView.scrollEnabled = YES;
			self.scrollView.delegate = self;
		}
    }
    
    return self;
}

- (void)dealloc {
	[mBackgroundView release];
	[mScrollView release];
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
	
	[self.contentView removeFromSuperview];
	self.contentView = view;
	
	[self.scrollView addSubview:view];
	self.scrollView.contentSize = view.frame.size;
	
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

- (void)scrollToPoint:(CGPoint)point animated:(BOOL)animated {
	NSLog(@"scroll to point %f,%f", point.x, point.y);
	if (animated) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:kParallaxScrollingSpeed];
		self.scrollView.contentOffset = point;
		[UIView commitAnimations];
	} else {
		self.scrollView.contentOffset = point;
	}
}

- (void)scrollToZeroAnimated:(BOOL)animated {
	[self scrollToPoint:CGPointMake(0.0, 0.0) animated:animated];
}

- (void)scrollToTopAnimated:(BOOL)animated {
	CGPoint p = self.scrollView.contentOffset;
	[self scrollToPoint:CGPointMake(p.x, 0.0) animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
	CGPoint p = self.scrollView.contentOffset;
	[self scrollToPoint:CGPointMake(0.0, p.y) animated:animated];	
}

- (void)scrollToBottomAnimated:(BOOL)animated {
	CGPoint p = self.scrollView.contentOffset;
	CGSize s = self.scrollView.frame.size;
	CGSize c = self.contentView.frame.size;
	[self scrollToPoint:CGPointMake(p.x, c.height-s.height) animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
	CGPoint p = self.scrollView.contentOffset;
	CGSize s = self.scrollView.frame.size;
	CGSize c = self.contentView.frame.size;
	[self scrollToPoint:CGPointMake(c.width-s.width, p.y) animated:animated];
}

- (void)scrollToCenterAnimated:(BOOL)animated {
	CGSize s = self.scrollView.frame.size;
	CGSize c = self.contentView.frame.size;
	
	[self scrollToPoint:CGPointMake((c.width-s.width)/2, (c.height-s.height)/2) animated:animated];
}

- (void)scrollToView:(UIView*)view {
	CGPoint center = view.center;
	
	float x = center.x-self.scrollView.frame.size.width/2;
	float y = center.y-self.scrollView.frame.size.height/2;
	
	[self scrollToPoint:CGPointMake(x, y) animated:YES];
}


@end
