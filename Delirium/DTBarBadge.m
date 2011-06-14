//
//  DTBarButtonBadge.m
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTBarBadge.h"


@interface DTBarBadge ()
- (void)valueDisplayUpdate;
@end


@implementation DTBarBadge

@synthesize 
value=mValue,
badge=mBadge;


- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
		mBadge = [UIButton buttonWithType:UIButtonTypeCustom];
		mBadge.titleEdgeInsets = UIEdgeInsetsMake(-8, 0, 0, 0);
		[mBadge setBackgroundImage:[[UIImage imageNamed:@"badge.png"] stretchableImageWithLeftCapWidth:14.0 topCapHeight:0.0] forState:UIControlStateNormal];
		mBadge.frame = CGRectMake(0, 0, 29*1.2, 32*1.2);
		self.customView = mBadge;
    }
    
    return self;
}

- (id)initWithValue:(NSUInteger)value target:(id)target action:(SEL)action {
	[self init];
	mValue = value;
	[mBadge addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	[self valueDisplayUpdate];	
	return self;
}

- (void)setValue:(NSUInteger)value {
	mValue = value;
	[self valueDisplayUpdate];
}



- (void)valueDisplayUpdate {
	if (mValue == 0) {
		mBadge.hidden = YES;
	} else {
		mBadge.hidden = NO;		
	}
	
	NSString *string = [[NSNumber numberWithInt:mValue] stringValue];
	UIFont *font = kBarBadgeFont;
	CGSize size = [string sizeWithFont:font];
	
	CGRect frame = mBadge.frame;
	frame.size.width = MAX(29*1.2, size.width+12);
	mBadge.frame = frame;
	mBadge.titleLabel.font = font;
	[mBadge setTitle:string forState:UIControlStateNormal];
}



@end
