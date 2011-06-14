//
//  DTBarButtonItemViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 13/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DTBarButtonBadge;

@interface DTBarButtonBadgeViewController : UIViewController {
	DTBarButtonBadge *barButtonBadge;
}

@property (nonatomic, retain) DTBarButtonBadge *barButtonBadge;

- (IBAction)tapme:(id)sender;

@end
