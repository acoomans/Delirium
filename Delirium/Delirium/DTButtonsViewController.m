//
//  DTButtonsViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTButtonsViewController.h"


@implementation DTButtonsViewController

@synthesize redButton, blueButton, greenButton, yellowButton, blackButton, whiteButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
	[redButton release];
	[blueButton release];
	[greenButton release];
	[yellowButton release];
	[blackButton release];
	[whiteButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	redButton.color = DTButtonRedColor;
	blueButton.color = DTButtonBlueColor;
	greenButton.color = DTButtonGreenColor;
	yellowButton.color = DTButtonYellowColor;
	blackButton.color = DTButtonBlackColor;
	whiteButton.color = DTButtonWhiteColor;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
