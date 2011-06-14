//
//  DeliriumMenuViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 09/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeliriumMenuViewController : UITableViewController {
	NSArray *controllersClasses;
}

@property (nonatomic, retain) NSArray *controllersClasses;

- (NSString*)shortNameForClass:(id)class;

@end
