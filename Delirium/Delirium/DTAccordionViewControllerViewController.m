//
//  DTAccordionViewControllerViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewControllerViewController.h"

@implementation DTAccordionViewControllerViewController

@synthesize tableSource, tableHeaders;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableSource = [NSArray arrayWithObjects:
						[NSArray arrayWithObjects:@"Blonde", @"Brune", @"Ambrée", nil],
						[NSArray arrayWithObjects:@"Pils", @"Trappiste", @"Abbaye", nil],
						[NSArray arrayWithObjects:@"Lambic", @"Gueuze", @"Kriek", @"Pêche", nil],
						[NSArray arrayWithObjects:@"Double", @"Triple", nil],
						[NSArray arrayWithObjects:@"Spéciale de Noël", nil],
						nil];
	self.tableHeaders = [NSArray arrayWithObjects:@"Title1", @"Title2", @"Title3", @"Title4", @"Title5", nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.tableHeaders = nil;
	self.tableSource = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if ([super tableView:tableView isOpenSection:section]) {
	    return [[self.tableSource objectAtIndex:section] count];
	}
	return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [[self.tableSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
	[UIView beginAnimations:@"fade out accordion" context:nil];
	[UIView setAnimationDuration:0.05];
	cell.textLabel.alpha = 1.0;
	[UIView commitAnimations];
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [self.tableHeaders objectAtIndex:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	DTAccordionHeader *headerView = [super tableView:tableView viewForHeaderInSection:section];
	headerView.backgroundColor = [UIColor purpleColor];
	
	headerView.title.text = [self tableView:tableView titleForHeaderInSection:section];
	headerView.title.textColor = [UIColor whiteColor];
	
	return headerView;
}



@end
