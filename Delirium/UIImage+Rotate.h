//
//  UIImage+Rotate.h
//  Delirium
//
//  Created by arnaud on 11/02/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

// doc: http://blog.logichigh.com/2008/06/05/uiimage-fix/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Rotate)

- (UIImage*)rotate:(UIImageOrientation) orientation;

@end
