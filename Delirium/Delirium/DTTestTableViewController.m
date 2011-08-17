//
//  DTTestTableViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTTestTableViewController.h"

@implementation DTTestTableViewController

@synthesize tableSource, tableHeaders;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableSource = [NSArray arrayWithObjects:
						[NSArray arrayWithObjects:@"Blonde", @"Brune", @"Ambrée", nil],
						[NSArray arrayWithObjects:@"Pils", @"Trappiste", @"Abbaye", nil],
						[NSArray arrayWithObjects:@"Lambic", @"Gueuze", @"Kriek", @"Pêche", nil],
						[NSArray arrayWithObjects:@"Double", @"Triple", nil],
						[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", nil],
						[NSArray arrayWithObjects:@"Spéciale de Noël", nil],
						nil];
	self.tableHeaders = [NSArray arrayWithObjects:@"Title1", @"Title2", @"Title3", @"Title4", @"Title5", @"Title6", nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.tableSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [[self.tableSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

@end
