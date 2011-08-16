//
//  DTAccordionSectionDelegate.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTAccordionSectionView;

@protocol DTAccordionSectionDelegate <NSObject>
- (void)openAccordionSection:(DTAccordionSectionView*)accordionSection;
@optional
- (void)didOpenAccordionSection:(DTAccordionSectionView*)accordionSection;
- (void)didCloseAccordionSection:(DTAccordionSectionView*)accordionSection;
@end
