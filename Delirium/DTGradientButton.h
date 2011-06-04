//
//  DTGradientButton.h
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "DTButtonColors.h"


#define kColorfulButtonCornerRadius 8.0f
#define kColorfulButtonBorderWidth 2.0f

@interface DTGradientButton : UIButton {
	DTButtonColor mColor;
    NSArray *mGradientColors;
	NSArray *mGradientLocations;	
    CAGradientLayer *mGradientLayer;
}

@property (nonatomic, assign) DTButtonColor color;
@property (nonatomic, retain) NSArray *gradientColors;
@property (nonatomic, retain) NSArray *gradientLocations;
@property (nonatomic, retain) CAGradientLayer *gradientLayer;

- (void)setGradientColors:(NSArray*)colors Locations:(NSArray*)locations;

@end
