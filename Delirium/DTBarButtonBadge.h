//
//  DTBarButtonBadge.h
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBarButtonBadgeFont [UIFont fontWithName:@"Helvetica" size:14.0]


@interface DTBarButtonBadge : UIBarButtonItem {
	NSUInteger mValue;
	UIButton *mButton;
	
	UIImageView *mBadgeImage;
	UILabel *mBadgeLabel;
}

@property (nonatomic, assign) NSUInteger value;
@property (nonatomic, retain, readonly) UIButton *button;
@property (nonatomic, retain, readonly) UIImageView *badgeImage;
@property (nonatomic, retain, readonly) UILabel *badgeLabel;

- (id)initWithValue:(NSUInteger)value target:(id)target action:(SEL)action;

@end
