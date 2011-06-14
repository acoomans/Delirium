//
//  DTBarButtonBadgeViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTBarBadgeViewController.h"
#import "DTBarBadge.h"


@implementation DTBarBadgeViewController

@synthesize barButtonBadge;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[barButtonBadge release];
	[super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	barButtonBadge = [[DTBarBadge alloc] initWithValue:1 target:self action:@selector(tapme:)];
    self.navigationItem.rightBarButtonItem = barButtonBadge;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.barButtonBadge = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)tapme:(id)sender {
	self.barButtonBadge.value = self.barButtonBadge.value << 2;
}

@end
