//
//  DTKenBurnsView.m
//  Delirium
//
//  Created by Arnaud Coomans on 06/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTKenburnsView.h"


@interface DTKenburnsView ()
- (void)kenburnsInit;
- (void)kenburnsEffect;
- (void)kenburnsFadeIn;
- (void)kenburnsFadeOut;
@end



@implementation DTKenburnsView

@synthesize
kenburnsImages=mKenburnsImages,
kenburnsVectors=mKenburnsVectors,
isAnimating=mIsAnimating,
kenburnsIndex=mKenburnsIndex,
kenburnsImageView=mKenburnsImageView,
kenburnsDirection=mKenburnsDirection,
kenburnsXOffset=mKenburnsXOffset,
kenburnsYOffset=mKenburnsYOffset,
kenburnsScale=mKenburnsScale,
kenburnsFadeInDuration=mKenburnsFadeInDuration,
kenburnsFadeOutDuration=mKenburnsFadeOutDuration;


- (void)awakeFromNib {
	[self kenburnsInit];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self kenburnsInit];
    }
    return self;
}

- (void)kenburnsInit {
	self.kenburnsDirection = kKenburnsDirection;
	self.kenburnsXOffset = kKenburnsXOffset;
	self.kenburnsYOffset = kKenburnsYOffset;
	self.kenburnsFadeInDuration = kKenburnsFadeInDuration;
	self.kenburnsFadeOutDuration = kKenburnsFadeOutDuration;
	
	if (!self.kenburnsImageView) {
		mKenburnsImageView = [[UIImageView alloc] init];
		[self addSubview:self.kenburnsImageView];
		[self sendSubviewToBack:self.kenburnsImageView];
		self.kenburnsImageView.contentMode = UIViewContentModeScaleAspectFill;
	}
	self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
	NSLog(@"dealloc");
	[mKenburnsImageView release];
	[mKenburnsImages release];
	[mKenburnsVectors release];
    [super dealloc];
}



#pragma mark --
#pragma mark ken burn effect

- (void)startKenburns {
	NSLog(@"startKenburns");
	
	if (self.isAnimating) {
		// is already running, don't animate a second time
		return;
	}
	
	if ([self.kenburnsImages count]) {
		mIsAnimating = YES;
		[self kenburnsEffect];
	}
}

- (void)stopKenburns {
	NSLog(@"stopKenburns");
	mIsAnimating = NO;
    
	CALayer *layer = self.kenburnsImageView.layer;
	[layer performSelector:@selector(removeAllAnimations)];
}

- (void)kenburnsEffect {
    NSLog(@"kenburnsEffect");
	if (!mIsAnimating) return;
	
	NSLog(@"index %d", self.kenburnsIndex);

	
	self.kenburnsImageView.image = [UIImage imageNamed:[self.kenburnsImages objectAtIndex:self.kenburnsIndex]];
	
	float s = sqrtf(
					pow((self.kenburnsXOffset+self.frame.size.width)/self.frame.size.width,2) + 
					pow((self.kenburnsYOffset+self.frame.size.height)/self.frame.size.height,2)
	);
	
	mKenburnsStartRect = CGRectMake(
									self.kenburnsXOffset,
									self.kenburnsYOffset,
									self.frame.size.width  *s, 
									self.frame.size.height *s);
	
	mKenburnsEndRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	
	NSDictionary *vector = nil;
	if (self.kenburnsVectors &&
		[self.kenburnsVectors count] > self.kenburnsIndex &&
		(vector = [self.kenburnsVectors objectAtIndex:self.kenburnsIndex])
		) {
		
		NSLog(@"vector %@", vector);
		
		NSNumber *scale = [vector objectForKey:@"scale"];
		if (scale) {
			mKenburnsStartRect.size.width  = self.frame.size.width  * [scale floatValue];
			mKenburnsStartRect.size.height = self.frame.size.height * [scale floatValue];
		}
		
		NSNumber *xOffset = [vector objectForKey:@"xOffset"];
		if (xOffset) {
			mKenburnsStartRect.origin.x = [xOffset floatValue];
		}
		
		NSNumber *yOffset = [vector objectForKey:@"yOffset"];
		if (yOffset) {
			mKenburnsStartRect.origin.y = [yOffset floatValue];
		}
	}
	
	NSNumber *direction = [vector objectForKey:@"direction"];
	if (
		(self.kenburnsDirection == NO) ||
		(vector && direction && ([direction intValue] == 0))
		
		) {
		
		CGRect swapRect = mKenburnsStartRect;
		mKenburnsStartRect = mKenburnsEndRect;
		mKenburnsEndRect = swapRect;
	}
	
	self.kenburnsImageView.frame = mKenburnsStartRect;
	
	NSLog(@"mKenburnsStartRect %f,%f,%f,%f",
		  mKenburnsStartRect.origin.x,
		  mKenburnsStartRect.origin.y,
		  mKenburnsStartRect.size.width,
		  mKenburnsStartRect.size.height);
	
	NSLog(@"mKenburnsEndRect %f,%f,%f,%f",
		  mKenburnsEndRect.origin.x,
		  mKenburnsEndRect.origin.y,
		  mKenburnsEndRect.size.width,
		  mKenburnsEndRect.size.height);
	
	[self kenburnsFadeIn];
	mKenburnsIndex = (mKenburnsIndex+1) % [self.kenburnsImages count];
}

- (void)kenburnsFadeIn {
    NSLog(@"kenburnsFadeIn");
	if (!mIsAnimating) return;
	
	[UIView beginAnimations:@"kenburnsFadeInAnimation" context:NULL];
	[UIView setAnimationDuration:self.kenburnsFadeInDuration];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	self.kenburnsImageView.alpha = 1.0;
	self.kenburnsImageView.frame = mKenburnsEndRect;
	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(kenburnsFadeOut)];
	[UIView commitAnimations];
	
	
}

- (void)kenburnsFadeOut {    
    NSLog(@"kenburnsFadeOut");
	
	[UIView beginAnimations:@"kenburnsFadeOutAnimation" context:NULL];
	[UIView setAnimationDuration:self.kenburnsFadeOutDuration];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	self.kenburnsImageView.alpha = 0.0;
	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(kenburnsEffect)];
	[UIView commitAnimations];
}


@end
