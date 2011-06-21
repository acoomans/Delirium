//
//  DTParallaxViewControllerViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTParallaxViewControllerViewController.h"

@implementation DTParallaxViewControllerViewController

@synthesize textField=mTextField;

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

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setBackgroundImage:[UIImage imageNamed:@"background.png"]];
	[self scrollToCenterAnimated:NO];
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

#pragma mark - actions

- (IBAction)scrollToZero {
	[self scrollToZeroAnimated:YES];
}
- (IBAction)scrollToTop {
	[self scrollToTopAnimated:YES];
}
- (IBAction)scrollToLeft {
	[self scrollToLeftAnimated:YES];
}
- (IBAction)scrollToBottom {
	[self scrollToBottomAnimated:YES];
}
- (IBAction)scrollToRight {
	[self scrollToRightAnimated:YES];
}
- (IBAction)scrollToCenter {
	[self scrollToCenterAnimated:YES];
}


- (IBAction)focusAction:(id)sender {
	[self scrollToView:self.textField];
}


#pragma mark - textField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}




@end
