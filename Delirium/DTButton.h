//
//  DTButton.h
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DTButtonColors.h"


@interface DTButton : UIButton {
    DTButtonColor mColor;
}

@property (nonatomic, assign) DTButtonColor color;

@end
