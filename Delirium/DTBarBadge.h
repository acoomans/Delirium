//
//  DTBarButtonBadge.h
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBarBadgeFont [UIFont fontWithName:@"Helvetica" size:17.0]

@interface DTBarBadge : UIBarButtonItem {
	NSUInteger mValue;
	UIButton *mBadge;
}

@property (nonatomic, assign) NSUInteger value;
@property (nonatomic, readonly) UIButton *badge;

- (id)initWithValue:(NSUInteger)value target:(id)target action:(SEL)action;

@end
