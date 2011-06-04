//
//  DTGradientButtonViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTGradientButton.h"

@interface DTGradientButtonViewController : UIViewController {
    DTGradientButton *redButton;
    DTGradientButton *blueButton;
    DTGradientButton *greenButton;
    DTGradientButton *yellowButton;
}

@property (nonatomic, retain) IBOutlet DTGradientButton *redButton;
@property (nonatomic, retain) IBOutlet DTGradientButton *blueButton;
@property (nonatomic, retain) IBOutlet DTGradientButton *greenButton;
@property (nonatomic, retain) IBOutlet DTGradientButton *yellowButton;

@end
