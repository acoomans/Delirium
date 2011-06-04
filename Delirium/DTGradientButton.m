//
//  DTGradientButton.m
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "Delirium.h"
#import "DTGradientButton.h"


@interface DTGradientButton ()
- (NSArray*)gradientRedColors;
- (NSArray*)gradientGreenColors;
- (NSArray*)gradientYellowColors;
- (NSArray*)gradientBlueColors;
- (NSArray*)gradientLocations;
@end


@implementation DTGradientButton

@synthesize
color=mColor,
gradientColors=mGradientColors,
gradientLocations=mGradientLocations,
gradientLayer=mGradientLayer;


- (void)awakeFromNib {
    mGradientLayer = [[CAGradientLayer alloc] init];
    [mGradientLayer setBounds:[self bounds]];
    [mGradientLayer setPosition:CGPointMake([self bounds].size.width/2, [self bounds].size.height/2)];
    [[self layer] insertSublayer:mGradientLayer atIndex:0];
	
	[[self layer] setCornerRadius:kColorfulButtonCornerRadius];
    [[self layer] setBorderWidth:kColorfulButtonBorderWidth];
    [[self layer] setMasksToBounds:YES];
	
}

- (void)drawRect:(CGRect)rect {
	if (self.gradientLayer && self.gradientColors && self.gradientLocations) {
		[self.gradientLayer setColors:self.gradientColors];
		[self.gradientLayer setLocations:self.gradientLocations];
	}
	
    [super drawRect:rect];
}


- (void)dealloc {
	[mGradientLayer release];
	[mGradientColors release];
	[mGradientLocations release];
    [super dealloc];
}


- (void)setGradientColors:(NSArray*)colors Locations:(NSArray*)locations {
	self.gradientColors = colors;
	self.gradientLocations = locations;
	[[self layer] setNeedsDisplay];
}


- (void)setColor:(DTButtonColor)color {
	mColor = color;
	
	switch (color) {
		case DTButtonRedColor:
			self.gradientColors = [self gradientRedColors];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(153, 51, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonBlueColor:
			self.gradientColors = [self gradientBlueColors];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(102, 102, 102) forState:UIControlStateNormal];
			break;
			
		case DTButtonGreenColor:
			self.gradientColors = [self gradientGreenColors];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(51, 102, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonYellowColor:
			self.gradientColors = [self gradientYellowColors];
			[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(102, 102, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonNoColor:
		default:
			self.gradientLocations = nil;
			self.gradientLocations = nil;
			break;
	}
	
	if (color) {
		self.gradientLocations = [self gradientLocations];
		self.titleLabel.shadowOffset = CGSizeMake (0.0, -1.0);
		self.reversesTitleShadowWhenHighlighted = YES;
		[[self layer] setNeedsDisplay];
	}
}


- (NSArray*)gradientRedColors {
	return [NSArray arrayWithObjects:
			(id)[[UIColor colorWithRed:233/255.0 green:161/255.0 blue:164/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:223/255.0 green:123/255.0 blue:128/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:223/255.0 green:123/255.0 blue:128/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:194/255.0 green:35/255.0 blue:33/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:194/255.0 green:35/255.0 blue:33/255.0 alpha:1] CGColor],
			nil];
}

- (NSArray*)gradientGreenColors {
	return [NSArray arrayWithObjects:
			(id)[[UIColor colorWithRed:156/255.0 green:207/255.0 blue:161/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:121/255.0 green:190/255.0 blue:127/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:51/255.0 green:172/255.0 blue:61/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:4/255.0 green:159/255.0 blue:19/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:0/255.0 green:154/255.0 blue:12/255.0 alpha:1] CGColor],
			nil];
}

- (NSArray*)gradientYellowColors {
	return [NSArray arrayWithObjects:
			(id)[[UIColor colorWithRed:243/255.0 green:234/255.0 blue:212/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:228/255.0 green:208/255.0 blue:158/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:239/255.0 green:205/255.0 blue:101/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:240/255.0 green:190/255.0 blue:40/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:249/255.0 green:220/255.0 blue:36/255.0 alpha:1] CGColor],
			nil];
}

- (NSArray*)gradientBlueColors {
	return [NSArray arrayWithObjects:
			(id)[[UIColor colorWithRed:105/255.0 green:136/255.0 blue:204/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:117/255.0 green:154/255.0 blue:232/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:55/255.0 green:111/255.0 blue:224/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:35/255.0 green:97/255.0 blue:222/255.0 alpha:1] CGColor],
			(id)[[UIColor colorWithRed:36/255.0 green:99/255.0 blue:222/255.0 alpha:1] CGColor],
			nil];
}

- (NSArray*)gradientLocations {
	return [NSArray arrayWithObjects:
	 (id)[NSNumber numberWithFloat:0.0],
	 (id)[NSNumber numberWithFloat:0.1],
	 (id)[NSNumber numberWithFloat:0.49],
	 (id)[NSNumber numberWithFloat:0.5],
	 (id)[NSNumber numberWithFloat:1.0],
	 nil];
}


@end
