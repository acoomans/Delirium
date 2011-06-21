//
//  DTParallaxViewControllerViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTParallaxViewController.h"

@interface DTParallaxViewControllerViewController : DTParallaxViewController <UITextFieldDelegate> {
	UITextField *mTextField;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction)scrollToZero;
- (IBAction)scrollToTop;
- (IBAction)scrollToLeft;
- (IBAction)scrollToBottom;
- (IBAction)scrollToRight;
- (IBAction)scrollToCenter;

- (IBAction)focusAction:(id)sender;

@end
