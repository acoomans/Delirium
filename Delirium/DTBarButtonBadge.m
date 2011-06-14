//
//  DTBarButtonBadge.m
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTBarButtonBadge.h"


@interface DTBarButtonBadge ()
- (void)valueDisplayUpdate;
@end


@implementation DTBarButtonBadge

@synthesize
value=mValue,
button=mButton,
badgeImage=mBadgeImage,
badgeLabel=mBadgeLabel;


- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
		self.customView = [[UIView alloc] init];
		self.customView.frame = CGRectMake(0, 3, 44.0, 30.0);
		
		mButton = [UIButton buttonWithType:UIButtonTypeCustom];
		mButton.frame = CGRectMake(0, 0, 44.0, 30.0);
		[self.customView addSubview:mButton];
		
		float width = 29.0;
		
		mBadgeImage = [[UIImageView alloc] initWithFrame:CGRectMake(15-width, -6, width, 32.0*1.1)];
		mBadgeImage.image = [[UIImage imageNamed:@"badge.png"] stretchableImageWithLeftCapWidth:14.0 topCapHeight:0.0];
		[self.customView addSubview:mBadgeImage];
		
		mBadgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15-width, -6-2, width, 32.0)];
		mBadgeLabel.backgroundColor = [UIColor clearColor];
		mBadgeLabel.textColor = [UIColor whiteColor];
		mBadgeLabel.textAlignment = UITextAlignmentCenter;
		[self.customView addSubview:mBadgeLabel];
    }
    return self;
}


- (id)initWithValue:(NSUInteger)value target:(id)target action:(SEL)action {
	[self init];
	mValue = value;
	
	[mButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	[mButton setImage:[UIImage imageNamed:@"profile.png"] forState:UIControlStateNormal];
	
	[self valueDisplayUpdate];	
	return self;
}

- (void)setValue:(NSUInteger)value {
	mValue = value;
	[self valueDisplayUpdate];
}


- (void)valueDisplayUpdate {
	if (mValue == 0) {
		mBadgeImage.hidden = mBadgeLabel.hidden = YES;
	} else {
		mBadgeImage.hidden = mBadgeLabel.hidden = NO;		
	}

	NSString *string = [[NSNumber numberWithInt:mValue] stringValue];
	UIFont *font = kBarButtonBadgeFont;
	CGSize size = [string sizeWithFont:font];
	float width = MAX(29*1.1, size.width+12);
	
	mBadgeImage.frame = CGRectMake(15-width, -6, width, 32.0*1.1);
	
	mBadgeLabel.frame = CGRectMake(15-width, -6-2, width, 32.0);
	mBadgeLabel.text = string;
	mBadgeLabel.font = font;
}



@end
