//
//  DTKenBurnsView.h
//  Delirium
//
//  Created by Arnaud Coomans on 06/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kKenburnsDirection YES;
#define kKenburnsXOffset -50.0
#define kKenburnsYOffset -50.0
#define kKenburnsFadeInDuration 3.0
#define kKenburnsFadeOutDuration 1.2


@interface DTKenburnsView : UIView {
    
	NSArray *mKenburnsImages;
	NSArray *mKenburnsVectors;
	BOOL mIsAnimating;
	NSUInteger mKenburnsIndex;
	UIImageView *mKenburnsImageView;
	
	CGRect mKenburnsStartRect;
	CGRect mKenburnsEndRect;
	
	// default values if not using vectors
	BOOL  mKenburnsDirection;
	float mKenburnsXOffset;
	float mKenburnsYOffset;
	float mKenburnsScale;
	float mKenburnsFadeInDuration;
	float mKenburnsFadeOutDuration;
}

@property (nonatomic, retain) NSArray *kenburnsImages;
@property (nonatomic, retain) NSArray *kenburnsVectors;
@property (assign, readonly) BOOL isAnimating;
@property (nonatomic, assign, readonly) NSUInteger kenburnsIndex;
@property (nonatomic, retain, readonly) UIImageView *kenburnsImageView;

@property (nonatomic, assign) BOOL  kenburnsDirection;
@property (nonatomic, assign) float kenburnsXOffset;
@property (nonatomic, assign) float kenburnsYOffset;
@property (nonatomic, assign) float kenburnsScale;
@property (nonatomic, assign) float kenburnsFadeInDuration;
@property (nonatomic, assign) float kenburnsFadeOutDuration;

- (void)startKenburns;
- (void)stopKenburns;

@end
