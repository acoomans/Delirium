//
//  DTBarButtonBadgeViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTBarBadge.h"

@interface DTBarBadgeViewController : UIViewController {
	DTBarBadge *barButtonBadge;
}

@property (nonatomic, retain) DTBarBadge *barButtonBadge;

- (IBAction)tapme:(id)sender;

@end
