//
//  DTAccordionDelegate.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTAccordionViewController;

@protocol DTAccordionDelegate <NSObject>
@optional
- (void)willUpdateSectionsForAccordion:(DTAccordionViewController*)accordion;
- (void)didUpdateSectionsForAccordion:(DTAccordionViewController*)accordion;
- (void)accordion:(DTAccordionViewController*)accordion willOpenSectionAtIndex:(NSUInteger)index;
- (void)accordion:(DTAccordionViewController*)accordion didOpenSectionAtIndex:(NSUInteger)index;
- (void)accordion:(DTAccordionViewController*)accordion willCloseSectionAtIndex:(NSUInteger)index;
- (void)accordion:(DTAccordionViewController*)accordion didCloseSectionAtIndex:(NSUInteger)index;
@end
