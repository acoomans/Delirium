//
//  DTAccordionViewControllerViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewControllerViewController.h"


@implementation DTAccordionViewControllerViewController

@synthesize sectionSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sectionSource = [NSArray arrayWithObjects:
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section1", @"title",
								nil],
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section2", @"title",
							   nil],
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section3", @"title",
							   nil],
							  
							  nil];
		self.delegate = self;
		self.dataSource = self;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - DTAccordionDataSource

- (NSUInteger)numberOfSectionsForAccordion:(DTAccordionViewController*)accordion {
	return [self.sectionSource count];
}

/*
- (UIView*)accordion:(DTAccordionViewController*)accordion headerForSectionAtIndex:(NSUInteger)index {
	
}
*/

/*
- (CGFloat)accordion:(DTAccordionViewController*)accordion heightOfheaderForSectionAtIndex:(NSUInteger)index {
	
}
*/

- (NSString*)accordion:(DTAccordionViewController*)accordion headerTitleForSectionAtIndex:(NSUInteger)index {
	return [[self.sectionSource objectAtIndex:index] objectForKey:@"title"];
}

/*
- (UIView*)accordion:(DTAccordionViewController*)accordion subviewForSectionAtIndex:(NSUInteger)index {
	
}
*/




@end
