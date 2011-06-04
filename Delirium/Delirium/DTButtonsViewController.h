//
//  DTButtonsViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTButton.h"


@interface DTButtonsViewController : UIViewController {
    DTButton *redButton;
    DTButton *blueButton;
    DTButton *greenButton;
    DTButton *yellowButton;
    DTButton *blackButton;
    DTButton *whiteButton;
}

@property (nonatomic, retain) IBOutlet DTButton *redButton;
@property (nonatomic, retain) IBOutlet DTButton *blueButton;
@property (nonatomic, retain) IBOutlet DTButton *greenButton;
@property (nonatomic, retain) IBOutlet DTButton *yellowButton;
@property (nonatomic, retain) IBOutlet DTButton *blackButton;
@property (nonatomic, retain) IBOutlet DTButton *whiteButton;

@end
