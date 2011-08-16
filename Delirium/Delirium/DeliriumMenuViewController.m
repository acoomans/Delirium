//
//  DeliriumMenuViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 09/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DeliriumMenuViewController.h"
#import "DTButtonsViewController.h"
#import "DTGradientButtonViewController.h"
#import "FadingViewController.h"
#import "DTKenburnsViewController.h"
#import "DTBarButtonBadgeViewController.h"
#import "DTBarBadgeViewController.h"
#import "DTParallaxTableViewControllerViewController.h"
#import "DTParallaxViewControllerViewController.h"
#import "DTTableAccordionViewControllerViewController.h"


@implementation DeliriumMenuViewController

@synthesize controllersClasses;


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Delirium";
	
	self.controllersClasses = [NSArray arrayWithObjects:
							   [DTButtonsViewController class], 
							   [DTGradientButtonViewController class],
							   [FadingViewController class],
							   [DTKenburnsViewController class],
							   [DTBarButtonBadgeViewController class],
							   [DTBarBadgeViewController class],
							   [DTParallaxTableViewControllerViewController class],
							   [DTParallaxViewControllerViewController class],
							   [DTTableAccordionViewControllerViewController class],
							   nil];
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controllersClasses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	
	id controllerClass = [self.controllersClasses objectAtIndex:indexPath.row];
	cell.textLabel.text = [self shortNameForClass:controllerClass];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (NSString*)shortNameForClass:(id)class {
	NSString *name = [class description];
	NSRange textRange;
	textRange =[name rangeOfString:@"ViewController" options:NSBackwardsSearch];
	
	if (textRange.location != NSNotFound) {
		return [name substringToIndex:textRange.location];
	}
	return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	id controllerClass = [self.controllersClasses objectAtIndex:indexPath.row];
	id controller = [[controllerClass alloc] init];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

@end
