//
//  FadingViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "FadingViewController.h"
#import "UIView+Fading.h"


@implementation FadingViewController

@synthesize switch1, switch2, button;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
	[switch1 release];
	[switch2 release];
	[button release];
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

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.switch1 fadeOut];
	[self.switch2 fadeIn];
}

- (IBAction)again:(id)sender {
	if (switch1.hidden || switch1.alpha ==0) {
		[self.switch1 fadeIn];
		[self.switch2 fadeOut];
	} else {
		[self.switch1 fadeOut];
		[self.switch2 fadeIn];		
	}
}

@end
