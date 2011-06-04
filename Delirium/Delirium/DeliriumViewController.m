//
//  DeliriumViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DeliriumViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation DeliriumViewController


@synthesize button;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	button.color = DTButtonWhiteColor;
	
	return;
	// set up start button
    //UIImage *greenImage = [[UIImage imageNamed:@"green_button.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	UIImage *greenImage = [[UIImage imageNamed:@"DTButtons3.bundle/button-green.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	UIImage *redImage = [[UIImage imageNamed:@"red_button.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	
	[button setBackgroundImage:greenImage forState:UIControlStateNormal];
	[button setBackgroundImage:redImage forState:UIControlStateDisabled];
	
	return;
	
	UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
	b.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	b.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	UIImage *image = [UIImage imageNamed:@"button-red@2x.png"];//[UIImage imageNamed:@"DTButtons.bundle/button-green.png"];
//	UIImage *stretchedImage = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
	UIImage *stretchedImage = [image stretchableImageWithLeftCapWidth:16 topCapHeight:16];
	//[button setBackgroundImage:stretchedImage forState:UIControlStateNormal];
	
	//button.contentStretch = CGRectMake(0.45, 0.45, 0.1, 0.1);
	//button.contentMode = UIViewContentModeScaleToFill;
	
	[b setBackgroundImage:stretchedImage forState:UIControlStateNormal];
	//b.contentStretch = CGRectMake(0.45, 0.45, 0.1, 0.1);
	//b.contentMode = UIViewContentModeScaleToFill;
	[self.view addSubview:b];
	b.frame = CGRectMake(10, 10, 100, 50);

	UIImageView *u = [[UIImageView alloc] initWithImage:stretchedImage];
	[self.view addSubview:u];
	u.frame = CGRectMake(10, 70, 100, 100);
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
