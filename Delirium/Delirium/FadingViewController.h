//
//  FadingViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FadingViewController : UIViewController {
    UISwitch *switch1;
    UISwitch *switch2;
	UIButton *button;
}

@property (nonatomic, retain) IBOutlet UISwitch *switch1;
@property (nonatomic, retain) IBOutlet UISwitch *switch2;
@property (nonatomic, retain) IBOutlet UIButton *button;

- (IBAction)again:(id)sender;

@end
