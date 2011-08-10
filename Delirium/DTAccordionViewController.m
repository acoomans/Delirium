//
//  DTAccordionViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewController.h"


@interface DTAccordionViewController (Private)
- (void)closeSectionWithHeader:(DTAccordionHeader*)headerView;
- (void)openSection:(NSUInteger)section withHeader:(DTAccordionHeader*)headerView;
@end


@implementation DTAccordionViewController

@synthesize openSection, openSectionHeader;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.openSection = -1;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView isOpenSection:(NSInteger)section {
	return (openSection == section);
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 40.0;	
}

- (DTAccordionHeader *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	DTAccordionHeader *headerView = [[DTAccordionHeader alloc] initWithFrame:CGRectMake(0, 
																						0, 
																						self.view.frame.size.width, 
																						[self tableView:tableView heightForHeaderInSection:section])
									 forSection:section];
	UIGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureOnHeader:)];
	[headerView addGestureRecognizer:gestureRecognizer];
	
	headerView.indicator.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(90));
	headerView.indicatorShadow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(90));
	
	if ([self respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
		headerView.title.text = [self tableView:tableView titleForHeaderInSection:section];
	}
	
	return headerView;
}

- (void)handleTapGestureOnHeader:(UIGestureRecognizer *)gestureRecognizer {
	DTAccordionHeader *header = (DTAccordionHeader*)gestureRecognizer.view;
	NSLog(@"ok %d", header.section);
	
	[self closeSectionWithHeader:openSectionHeader];
	[self openSection:header.section withHeader:header];
}


- (void)closeSectionWithHeader:(DTAccordionHeader*)headerView {
	if (openSection == -1) return;
	
	NSUInteger oldOpenSection = openSection;
	
	[UIView beginAnimations:@"fade out accordion" context:nil];
	[UIView setAnimationDuration:0.05];
	
	headerView.indicator.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(90));
	headerView.indicatorShadow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(90));
	
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	NSIndexPath *indexPath = nil;
	UITableViewCell *cell = nil;

	for (int i=0; i<[self tableView:(UITableView*)self.view numberOfRowsInSection:oldOpenSection]; i++) {
		indexPath = [NSIndexPath indexPathForRow:i inSection:oldOpenSection];
		[indexPaths addObject:indexPath];
		
		cell = [self.tableView cellForRowAtIndexPath:indexPath];
		cell.textLabel.alpha = 0.0;
	}
	
	[UIView commitAnimations];
	
	openSection = -1;
	[self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
}

- (void)openSection:(NSUInteger)section withHeader:(DTAccordionHeader*)headerView{
	openSection = section;
	openSectionHeader = headerView;
	
	[UIView beginAnimations:@"fade in accordion" context:nil];
	[UIView setAnimationDuration:0.05];
	
	headerView.indicator.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(0));
	headerView.indicatorShadow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, DegreesToRadians(0));
	
	NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
	NSIndexPath *indexPath = nil;
	UITableViewCell *cell = nil;
	for (int i=0; i<[self tableView:(UITableView*)self.view numberOfRowsInSection:section]; i++) {
		indexPath = [NSIndexPath indexPathForRow:i inSection:section];
		[indexPaths addObject:indexPath];
		
		cell = [self.tableView cellForRowAtIndexPath:indexPath];
		cell.textLabel.alpha = 1.0;
	}
	[UIView commitAnimations];
	
	[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
}


@end
