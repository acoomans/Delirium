//
//  UIImage+Crop.m
//  Delirium
//
//  Created by arnaud on 28/12/10.
//  Copyright 2010 Arnaud Coomans. All rights reserved.
//

#import "UIImage+Crop.h"


@implementation UIImage (Crop)


- (UIImage*)imageCroptoRect:(CGRect)rect {
	
	NSLog(@"imageCroptoRect image.size=%fx%f", rect.size.width, rect.size.height);
	NSLog(@"imageCroptoRect image.origin=%fx%f", rect.origin.x, rect.origin.y);
	
	UIImage *imageToCrop = self;
	CGImageRef cropped = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect);
    UIImage *retImage = [UIImage imageWithCGImage:cropped];
    CGImageRelease(cropped);
	
    return retImage;	
}




@end
