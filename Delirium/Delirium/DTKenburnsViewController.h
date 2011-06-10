//
//  DTKenburnsViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 06/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTKenburnsView.h"


@interface DTKenburnsViewController : UIViewController {
    DTKenburnsView *kenburns;
	UIButton *button;
}

@property (nonatomic, retain) IBOutlet DTKenburnsView *kenburns;
@property (nonatomic, retain) IBOutlet UIButton *button;

- (IBAction)switchAction;


@end
