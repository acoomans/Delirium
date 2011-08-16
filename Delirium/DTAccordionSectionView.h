//
//  DTAccordionSectionView.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAccordionSectionDelegate.h"

@interface DTAccordionSectionView : UIView {
	id<DTAccordionSectionDelegate> mDelegate;
	UIView *mHeaderView;
	UIView *mContentView;
	UIButton *mButton;
	BOOL mIsOpen;
}

@property (nonatomic, assign) id<DTAccordionSectionDelegate> delegate;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIView *contentView;
@property (nonatomic, retain, readonly) UIButton *button;
@property (nonatomic, assign) BOOL isOpen;

- (void)openWithHeight:(CGFloat)height;
- (void)close;

@end
