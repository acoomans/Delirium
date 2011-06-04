//
//  DTButton.m
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "Delirium.h"
#import "DTButton.h"



@implementation DTButton

@synthesize color=mColor;


- (void)setColor:(DTButtonColor)color {
	mColor = color;
	
	UIImage *image = nil;
	
	switch (color) {
		case DTButtonRedColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-red.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(153, 51, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonBlueColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-blue.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(102, 102, 102) forState:UIControlStateNormal];
			break;
			
		case DTButtonGreenColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-green.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(51, 102, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonYellowColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-yellow.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(102, 102, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonBlackColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-black.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(51, 51, 51) forState:UIControlStateNormal];
			break;
			
		case DTButtonWhiteColor:
			image = [[UIImage imageNamed:@"DTButtons.bundle/button-white.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
			[self setBackgroundImage:image forState:UIControlStateNormal];
			[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
			[self setTitleShadowColor:DTRGB(102, 102, 102) forState:UIControlStateNormal];
			break;
			
		case DTButtonNoColor:
		default:
			break;
	}
	
	if (color) {
		self.titleLabel.shadowOffset = CGSizeMake (0.0, -1.0);
		self.reversesTitleShadowWhenHighlighted = YES;
	}
}


@end
