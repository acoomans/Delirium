//
//  DTAccordionSectionView.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionSectionView.h"

@implementation DTAccordionSectionView

@synthesize
delegate=mDelegate,
headerView=mHeaderView,
contentView=mContentView,
button=mButton,
isOpen=mIsOpen;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor grayColor];
		self.clipsToBounds = YES;
    }
    return self;
}

- (void)dealloc {
	[mHeaderView release];
	[mContentView release];
	[mButton release];
	[super dealloc];
}

- (void)setHeaderView:(UIView *)headerView {
	[headerView retain];
	mHeaderView = headerView;
	
	CGRect frame = headerView.frame;
	frame.origin.x = frame.origin.y = 0;
	headerView.frame = frame;
	[self addSubview:headerView];
	
	
	if (!self.button) {
		mButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[mButton addTarget:self action:@selector(headerTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	mButton.frame = frame;
	[self addSubview:mButton];
	
	frame = self.frame;
	frame.size.height = headerView.frame.size.height;
	self.frame = frame;
	mIsOpen = NO;
}

- (void)setContentView:(UIView *)contentView {
	[contentView retain];
	mContentView = contentView;
	
	CGRect frame = contentView.frame;
	frame.origin.x = 0;
	frame.origin.y = mHeaderView.frame.size.height;
	contentView.frame = frame;
	
	contentView.hidden = YES;
	self.contentView.alpha = 0.0;

	[self addSubview:contentView];
}

- (void)openWithHeight:(CGFloat)height {
	self.contentView.alpha = 0.0;
	self.contentView.hidden = NO;

	[UIView beginAnimations:@"openAccordionSectionAnimation" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(openWithHeightAnimationFinished)];
	self.contentView.alpha = 1.0;
	CGRect frame = self.frame;
	frame.size.height = height + self.headerView.frame.size.height;
	self.frame = frame;
	
	frame = self.contentView.frame;
	frame.size.height = height;
	self.contentView.frame = frame;
	
	[UIView commitAnimations];
}

- (void)openWithHeightAnimationFinished {
	if (self.delegate && [self.delegate respondsToSelector:@selector(didOpenAccordionSection:)]) {
		[self.delegate didOpenAccordionSection:self];
	}
	mIsOpen = YES;
}
						  
						  
						  
- (void)close {
	[UIView beginAnimations:@"closeAccordionSectionAnimation" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(closeAnimationFinished)];
	self.contentView.alpha = 0.0;
	CGRect frame = self.frame;
	frame.size.height = self.headerView.frame.size.height;
	self.frame = frame;
	[UIView commitAnimations];
}

- (void)closeAnimationFinished {
	self.contentView.hidden = YES;
	self.contentView.alpha = 0.0;
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(didCloseAccordionSection:)]) {
		[self.delegate didCloseAccordionSection:self];
	}
	
	mIsOpen = NO;
}

- (void)headerTapped:(id)sender {
	if (self.delegate && [self.delegate respondsToSelector:@selector(openAccordionSection:)]) {
		[self.delegate openAccordionSection:self];
	}
}


@end
