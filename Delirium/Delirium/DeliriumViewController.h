//
//  DeliriumViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DTButton.h"

@interface DeliriumViewController : UIViewController {
    DTButton *button;
}

@property (nonatomic, retain) IBOutlet DTButton *button;
@end
