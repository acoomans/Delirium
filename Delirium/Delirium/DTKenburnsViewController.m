//
//  DTKenburnsViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 06/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTKenburnsViewController.h"


@implementation DTKenburnsViewController

@synthesize kenburns, button;

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
    [super dealloc];
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
    // Do any additional setup after loading the view from its nib.
	
	NSArray *kenburnsImages = [NSArray arrayWithObjects:
							   @"IMG_1159.JPG", 
							   @"IMG_1147.JPG",
							   @"IMG_0977.JPG", 
							   @"IMG_0848.JPG",
							   @"IMG_0729.JPG",
							  nil];
	
	NSArray *kenburnsVectors = [NSArray arrayWithObjects:
								[NSDictionary dictionaryWithObjectsAndKeys:
									[NSNumber numberWithFloat:-200], @"xOffset",
									[NSNumber numberWithFloat:-200], @"yOffset",
									[NSNumber numberWithFloat:5.0], @"scale",
									[NSNumber numberWithInt:1], @"direction",
								nil],
								[NSDictionary dictionaryWithObjectsAndKeys:
									[NSNumber numberWithFloat:-400], @"xOffset",
									[NSNumber numberWithFloat:-200], @"yOffset",
									[NSNumber numberWithFloat:2.5], @"scale",
									[NSNumber numberWithInt:0], @"direction",
								nil],
								[NSDictionary dictionaryWithObjectsAndKeys:nil], //empty vector (use defaults)
								[NSDictionary dictionaryWithObjectsAndKeys:
									[NSNumber numberWithFloat:-100], @"xOffset",
									[NSNumber numberWithFloat:-100], @"yOffset",
									[NSNumber numberWithFloat:2.5], @"scale",
									[NSNumber numberWithInt:0], @"direction",
								nil],
								//one missing vector (use defaults)
								nil];
	self.kenburns.kenburnsImages = kenburnsImages;
	self.kenburns.kenburnsVectors = kenburnsVectors;
	[self.kenburns startKenburns];
	
	//[self.kenburns performSelector:@selector(stopKenburns) withObject:nil afterDelay:5.0];
}

- (IBAction)switchAction {
	if (!self.button.selected) {
		[self.kenburns stopKenburns];
	} else {
		[self.kenburns startKenburns];
	}
	self.button.selected = !self.button.selected;
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
