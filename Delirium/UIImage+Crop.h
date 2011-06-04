//
//  UIImage+Crop.h
//  Delirium
//
//  Created by arnaud on 28/12/10.
//  Copyright 2010 Arnaud Coomans. All rights reserved.
//
// doc: https://sites.google.com/a/injoit.com/knowledge-base/for-developers/graphics/uiimage-routines-scaling-cropping-rotating-etc

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImage (Crop)

- (UIImage*)imageCroptoRect:(CGRect)rect;

@end
