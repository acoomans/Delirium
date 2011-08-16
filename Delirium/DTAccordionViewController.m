//
//  DTAccordionViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewController.h"
#import "DTAccordionSectionView.h"


static const NSUInteger kDTAccordionViewControllerDefaultHeaderHeight = 44;
static const NSUInteger kDTAccordionViewControllerDefaultHeaderMarginX = 5;
static const NSUInteger kDTAccordionViewControllerDefaultHeaderMarginY = 5;

static const NSUInteger kDTAccordionViewControllerDefaultContentHeight = 60;
static const NSUInteger kDTAccordionViewControllerDefaultContentMarginX = 5;
static const NSUInteger kDTAccordionViewControllerDefaultContentMarginY = 5;

static const BOOL kDTAccordionViewControllerAllSectionsCanBeClosed = YES;
static const NSUInteger kDTAccordionViewControllerDefaultSection = 0;


@interface DTAccordionViewController ()
- (void)makeSections;
- (void)displaySections;
- (UIView*)defaultHeaderView;
- (UIView*)defaultContentView;
- (CGFloat)headerHeightSum;
- (void)updateSectionsWithOpenSectionAtIndex:(NSInteger)index animated:(BOOL)animated;
@end

@implementation DTAccordionViewController

@synthesize
dataSource=mDataSource,
delegate=mDelegate,
sections=mSections,
currentSectionIndex=mCurrentSectionIndex,
openingSectionIndex=mOpeningSectionIndex,
closingSectionIndex=mClosingSectionIndex;


- (id)init {
    self = [super init];
    if (self) {
		mCurrentSectionIndex = -1;
		mOpeningSectionIndex = -1;
		mClosingSectionIndex = -1;
    }
    
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[mSections release];
	[super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self makeSections];
	[self displaySections];
	if (!kDTAccordionViewControllerAllSectionsCanBeClosed) {
		[self openSectionAtIndex:kDTAccordionViewControllerDefaultSection animated:NO];
	}
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)makeSections {
	NSUInteger numberOfSections = 0;
	
	if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsForAccordion:)]) {
		numberOfSections = [self.dataSource numberOfSectionsForAccordion:self];
	}
	
	for (NSUInteger i=0; i < numberOfSections; i++) {
		UIView *headerView = nil;
		UIView *contentView = nil;
		
		if ([self.dataSource respondsToSelector:@selector(accordion:headerForSection:)]) {
			headerView = [self.dataSource accordion:self headerForSectionAtIndex:i];
		}
		if (!headerView) {
			headerView = [self defaultHeaderView];
			if (self.dataSource && [self.dataSource respondsToSelector:@selector(accordion:headerTitleForSectionAtIndex:)]) {
				UILabel *label = (UILabel*)[headerView.subviews objectAtIndex:0];
				label.text = [self.dataSource accordion:self headerTitleForSectionAtIndex:i];
			}
			
		}
		
		if ([self.dataSource respondsToSelector:@selector(accordion:subviewForSectionAtIndex:)]) {
			contentView = [self.dataSource accordion:self subviewForSectionAtIndex:i];
		}
		if (!contentView) {
			contentView = [self defaultContentView];
		}
		
		DTAccordionSectionView *section = [[DTAccordionSectionView alloc] initWithFrame:CGRectMake(0, 
																								   0,
																								   self.view.frame.size.width, 
																								   0)
										   ];
		section.delegate = self;
		section.headerView = headerView;
		section.contentView = contentView;
		if (!self.sections) mSections = [[NSMutableArray array] retain];
		[self.sections addObject:section];
	}
}


- (CGFloat)headerHeightSum {
	NSUInteger numberOfSections = 0;
	CGFloat heightSum = 0;
	
	if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsForAccordion)]) {
		numberOfSections = [self.dataSource numberOfSectionsForAccordion:self];
	}
	
	for (NSUInteger i=0; i < numberOfSections; i++) {
		if ([self.dataSource respondsToSelector:@selector(accordion:heightOfheaderForSection:)]) {
			heightSum += [self.dataSource accordion:self heightOfheaderForSectionAtIndex:i];
		}
	}
	return heightSum;
}


- (UIView*)defaultHeaderView {
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kDTAccordionViewControllerDefaultHeaderHeight)];
	view.backgroundColor = [UIColor blackColor];
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kDTAccordionViewControllerDefaultHeaderMarginX,
															  kDTAccordionViewControllerDefaultHeaderMarginY, 
															  self.view.frame.size.width-kDTAccordionViewControllerDefaultHeaderMarginX*2,
															  kDTAccordionViewControllerDefaultHeaderHeight-kDTAccordionViewControllerDefaultHeaderMarginY*2)];
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	[view addSubview:label];
	return view;
}

- (UIView*)defaultContentView {
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kDTAccordionViewControllerDefaultContentHeight)];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kDTAccordionViewControllerDefaultContentMarginX,
															   kDTAccordionViewControllerDefaultContentMarginY, 
															   self.view.frame.size.width-kDTAccordionViewControllerDefaultContentMarginX*2,
															   kDTAccordionViewControllerDefaultHeaderHeight-kDTAccordionViewControllerDefaultContentMarginY*2)];
	label.text = @"Empty section";
	label.textAlignment = UITextAlignmentCenter;
	[view addSubview:label];
	return view;
}


- (void)displaySections {
	for (DTAccordionSectionView *section in self.sections) {
		[self.view addSubview:section];
	}
	
	[self updateSectionsWithOpenSectionAtIndex:-1 animated:NO];
}



- (void)updateSectionsWithOpenSectionAtIndex:(NSInteger)index animated:(BOOL)animated {
	
	if (index<0) index = [mSections count]-1;
	
	DTAccordionSectionView *section = nil;
	CGFloat offset = 0;
	CGRect frame = CGRectZero;
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(willUpdateSectionsForAccordion:)]) {
		[self.delegate willUpdateSectionsForAccordion:self];
	}
	
	if (animated) {
		[UIView beginAnimations:@"updateAccordionAnimation" context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(updateSectionsAnimationFinished)];
		[UIView setAnimationBeginsFromCurrentState:YES];
	}
	
	
	for (int i=0; i<=index; i++) {
		section = [mSections objectAtIndex:i];
		frame = section.frame;
		frame.origin.y = offset;
		section.frame = frame;
		offset += section.headerView.frame.size.height;
	}
	
	
	offset = self.view.frame.size.height;
	for (int i=[mSections count]-1; i>index;i--) {
		section = [mSections objectAtIndex:i];
		offset -= section.headerView.frame.size.height;
		frame = section.frame;
		frame.origin.y = offset;
		section.frame = frame;
	}
	
	if (animated) {
		[UIView commitAnimations];
	}
}

- (void)updateSectionsAnimationFinished {
	if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateSectionsForAccordion:)]) {
		[self.delegate didUpdateSectionsForAccordion:self];
	}
}



#pragma mark - public methods

- (void)openSectionAtIndex:(NSUInteger)index animated:(BOOL)animated {
	if (index == mCurrentSectionIndex) {
		if (kDTAccordionViewControllerAllSectionsCanBeClosed) {
			[self closeCurrentSectionAnimated:animated];
			[self updateSectionsWithOpenSectionAtIndex:mOpeningSectionIndex animated:YES];
			return;
		} else {
			return;
		}
	}
	
	mOpeningSectionIndex = index;
	
	[self closeCurrentSectionAnimated:animated];
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(accordion:willOpenSectionAtIndex:)]) {
		[self.delegate accordion:self willOpenSectionAtIndex:mOpeningSectionIndex];
	}
	
	DTAccordionSectionView *section = [mSections objectAtIndex:mOpeningSectionIndex];
	CGFloat height = self.view.frame.size.height - [self headerHeightSum];
	[section openWithHeight:height];
	mCurrentSectionIndex = mOpeningSectionIndex;
	
	[self updateSectionsWithOpenSectionAtIndex:mOpeningSectionIndex animated:animated];
}

- (void)closeCurrentSectionAnimated:(BOOL)animated {
	if (mCurrentSectionIndex == -1) return;
	
	mClosingSectionIndex = self.currentSectionIndex;
	mCurrentSectionIndex = -1;
	
	if (self.delegate && [self.delegate respondsToSelector:@selector(accordion:willCloseSectionAtIndex:)]) {
		[self.delegate accordion:self willCloseSectionAtIndex:mClosingSectionIndex];
	}
	
	DTAccordionSectionView *section = [mSections objectAtIndex:mClosingSectionIndex];
	[section close];
}

/*
- (void)closeAllSections {
	if (mCurrentSectionIndex == -1) return;
	
	for (DTAccordionSectionView *section in self.sections) {
		[section close];
	}
	mCurrentSectionIndex = -1;
}
*/

#pragma mark - DTAccordionSectionDelegate


- (void)openAccordionSection:(DTAccordionSectionView*)accordionSection {
	NSUInteger section = [mSections indexOfObject:accordionSection];
	[self openSectionAtIndex:section animated:YES];
}

- (void)didOpenAccordionSection:(DTAccordionSectionView*)accordionSection {
	mCurrentSectionIndex = [mSections indexOfObject:accordionSection];
	if (self.delegate && [self.delegate respondsToSelector:@selector(accordion:didOpenSectionAtIndex:)]) {
		[self.delegate accordion:self didOpenSectionAtIndex:mCurrentSectionIndex];
	}
	mOpeningSectionIndex = -1;
}

- (void)didCloseAccordionSection:(DTAccordionSectionView*)accordionSection {
	if (self.delegate && [self.delegate respondsToSelector:@selector(accordion:didCloseSectionAtIndex:)]) {
		[self.delegate accordion:self didCloseSectionAtIndex:mClosingSectionIndex];
	}
	mClosingSectionIndex = -1;
}


@end
