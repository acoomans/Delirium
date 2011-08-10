//
//  DTAccordionViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAccordionHeader.h"

@interface DTAccordionViewController : UITableViewController

@property (nonatomic, assign) NSInteger openSection;
@property (nonatomic, assign) DTAccordionHeader *openSectionHeader;

- (DTAccordionHeader *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (NSInteger)tableView:(UITableView *)tableView isOpenSection:(NSInteger)section;

@end
