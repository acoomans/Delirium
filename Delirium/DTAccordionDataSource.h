//
//  DTAccordionDataSourceDelegate.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTAccordionViewController;

@protocol DTAccordionDataSource <NSObject>
@optional
- (NSUInteger)numberOfSectionsForAccordion:(DTAccordionViewController*)accordion;
- (UIView*)accordion:(DTAccordionViewController*)accordion headerForSectionAtIndex:(NSUInteger)index;
- (NSString*)accordion:(DTAccordionViewController*)accordion headerTitleForSectionAtIndex:(NSUInteger)index;
- (UIView*)accordion:(DTAccordionViewController*)accordion subviewForSectionAtIndex:(NSUInteger)index;
@end
