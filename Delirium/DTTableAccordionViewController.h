//
//  DTAccordionViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTTableAccordionHeader.h"

@interface DTTableAccordionViewController : UITableViewController

@property (nonatomic, assign) NSInteger openSection;
@property (nonatomic, assign) DTTableAccordionHeader *openSectionHeader;

- (DTTableAccordionHeader *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (NSInteger)tableView:(UITableView *)tableView isOpenSection:(NSInteger)section;

@end
