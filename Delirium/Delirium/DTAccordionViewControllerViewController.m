//
//  DTAccordionViewControllerViewController.m
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewControllerViewController.h"
#import "Delirium.h"
#import "DTTestTableViewController.h"


@implementation DTAccordionViewControllerViewController

@synthesize sectionSource, tableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sectionSource = [NSArray arrayWithObjects:
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section1", @"title",
								nil],
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section2", @"title",
							   nil],
							  
							  [NSDictionary dictionaryWithObjectsAndKeys:
							   @"Section3", @"title",
							   nil],
							  
							  nil];
		self.delegate = self;
		self.dataSource = self;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - DTAccordionDataSource

- (NSUInteger)numberOfSectionsForAccordion:(DTAccordionViewController*)accordion {
	return [self.sectionSource count];
}


- (UIView*)accordion:(DTAccordionViewController*)accordion headerForSectionAtIndex:(NSUInteger)index {
	UIView *header = nil;
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	switch (index) {
		case 0:;
			header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
			header.backgroundColor = DTRGB(240, 103, 238);
			label.text = @"Section1";
			break;
		case 1:;
			header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
			header.backgroundColor = DTRGB(184, 96, 234);
			label.text = @"Section2";
			break;
		case 2:;
		default:;
			header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
			header.backgroundColor = DTRGB(128, 81, 217);
			label.text = @"Section3";
			break;
	}
	[header addSubview:label];
	return header;
}


- (NSString*)accordion:(DTAccordionViewController*)accordion headerTitleForSectionAtIndex:(NSUInteger)index {
	return [[self.sectionSource objectAtIndex:index] objectForKey:@"title"];
}


- (UIView*)accordion:(DTAccordionViewController*)accordion subviewForSectionAtIndex:(NSUInteger)index {
	UIView *view = nil;
	switch (index) {
		case 0:;
			UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
			imageView.image = [UIImage imageNamed:@"IMG_1147.JPG"];
			view = imageView;
			break;
		case 1:;
			self.tableViewController = [[DTTestTableViewController alloc] init];
			view = self.tableViewController.view;
			view.frame = CGRectMake(0, 0, 320, 120);
			break;
		case 2:;
		default:
			break;
	}
	return view;
}





@end
