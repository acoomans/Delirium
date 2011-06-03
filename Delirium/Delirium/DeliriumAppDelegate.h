//
//  DeliriumAppDelegate.h
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeliriumViewController;

@interface DeliriumAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DeliriumViewController *viewController;

@end
