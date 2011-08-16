//
//  DTAccordionViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAccordionDataSource.h"
#import "DTAccordionDelegate.h"
#import "DTAccordionSectionDelegate.h"

@interface DTAccordionViewController : UIViewController <DTAccordionSectionDelegate> {
	id<DTAccordionDataSource> mDataSource;
	id<DTAccordionDelegate> mDelegate;
	NSMutableArray *mSections;
	NSInteger mCurrentSectionIndex;
	NSInteger mOpeningSectionIndex;
	NSInteger mClosingSectionIndex;
}

@property (nonatomic, assign) id<DTAccordionDataSource> dataSource;
@property (nonatomic, assign) id<DTAccordionDelegate> delegate;
@property (nonatomic, retain, readonly) NSMutableArray *sections;
@property (assign, readonly) NSInteger currentSectionIndex;
@property (nonatomic, assign, readonly) NSInteger openingSectionIndex;
@property (nonatomic, assign, readonly) NSInteger closingSectionIndex;


- (void)openSectionAtIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)closeCurrentSectionAnimated:(BOOL)animated;
//- (void)closeAllSections;

@end
