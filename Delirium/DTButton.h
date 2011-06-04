//
//  DTButton.h
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum _DTButtonColor {
	DTButtonNoColor = 0,
	DTButtonRedColor = 1,
	DTButtonBlueColor = 2,
	DTButtonGreenColor = 3,
	DTButtonYellowColor = 4,
	DTButtonBlackColor = 5,
	DTButtonWhiteColor = 6
} DTButtonColor;


@interface DTButton : UIButton {
    DTButtonColor mColor;
}

@property (nonatomic, assign) DTButtonColor color;

@end
