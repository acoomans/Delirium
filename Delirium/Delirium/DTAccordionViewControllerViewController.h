//
//  DTAccordionViewControllerViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionViewController.h"

@interface DTAccordionViewControllerViewController : DTAccordionViewController <DTAccordionDataSource, DTAccordionDelegate>

@property (nonatomic, retain) NSArray *sectionSource;
 
@end
